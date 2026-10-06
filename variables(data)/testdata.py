"""Data helpers used by Robot Framework suites."""

from pathlib import Path
from zipfile import ZipFile
import csv
import xml.etree.ElementTree as ET


MAIN_NS = "http://schemas.openxmlformats.org/spreadsheetml/2006/main"
REL_NS = "http://schemas.openxmlformats.org/officeDocument/2006/relationships"
PACKAGE_REL_NS = "http://schemas.openxmlformats.org/package/2006/relationships"


def read_credentials(csv_path: str):
    """Return credential rows from a CSV file as dictionaries."""
    with Path(csv_path).open(newline="", encoding="utf-8") as data_file:
        return list(csv.DictReader(data_file))


def valid_login_data():
    """Return the default valid-login record for examples and smoke tests."""
    return {"username": "demo-user", "password": "demo-password"}


def get_test_case_value(test_case_id: str, column_name: str, workbook_path: str):
    """Return one value from the Excel ``Test Cases`` sheet by test case ID."""
    rows = _read_test_case_rows(Path(workbook_path))
    for row in rows:
        if row.get("Test Case ID") == test_case_id:
            if column_name not in row:
                raise KeyError(f"Column not found in workbook: {column_name}")
            return row[column_name]
    raise KeyError(f"Test case not found in workbook: {test_case_id}")


def resolve_test_url(test_data: str, configured_url: str):
    """Resolve a human-readable workbook URL label to the configured URL."""
    if test_data.strip().lower() == "edureka url":
        return configured_url
    if test_data.startswith(("http://", "https://")):
        return test_data
    raise ValueError(f"Unsupported URL value in workbook: {test_data}")


def parse_contact_data(test_data: str):
    """Parse the comma-separated contact data used by the workbook."""
    values = {}
    for item in test_data.split(","):
        key, separator, value = item.partition(":")
        if not separator:
            raise ValueError(f"Invalid contact data item: {item}")
        values[key.strip().lower()] = value.strip()
    required = {"name", "email", "message"}
    missing = required.difference(values)
    if missing:
        raise ValueError(f"Contact data is missing: {', '.join(sorted(missing))}")
    return values


def _read_test_case_rows(workbook_path: Path):
    with ZipFile(workbook_path) as workbook:
        shared_strings = _read_shared_strings(workbook)
        sheet_paths = _read_sheet_paths(workbook)
        sheet_path = sheet_paths.get("Test Cases")
        if sheet_path is None:
            raise KeyError("Worksheet not found in workbook: Test Cases")
        sheet = ET.fromstring(workbook.read(sheet_path))
        rows = []
        headers = []
        for row in sheet.findall(f".//{{{MAIN_NS}}}row"):
            values = {}
            for cell in row.findall(f"{{{MAIN_NS}}}c"):
                reference = cell.attrib.get("r", "")
                column = "".join(character for character in reference if character.isalpha())
                value = cell.find(f"{{{MAIN_NS}}}v")
                text = "" if value is None else value.text or ""
                if cell.attrib.get("t") == "s" and text:
                    text = shared_strings[int(text)]
                values[column] = text
            ordered = [values.get(_column_name(index), "") for index in range(1, len(values) + 1)]
            if not headers:
                headers = ordered
                continue
            rows.append({header: ordered[index] for index, header in enumerate(headers) if header})
        return rows


def _read_shared_strings(workbook):
    path = "xl/sharedStrings.xml"
    if path not in workbook.namelist():
        return []
    root = ET.fromstring(workbook.read(path))
    return ["".join(element.itertext()) for element in root.findall(f".//{{{MAIN_NS}}}si")]


def _read_sheet_paths(workbook):
    workbook_root = ET.fromstring(workbook.read("xl/workbook.xml"))
    relationships = ET.fromstring(workbook.read("xl/_rels/workbook.xml.rels"))
    targets = {
        relationship.attrib["Id"]: relationship.attrib["Target"]
        for relationship in relationships.findall(f"{{{PACKAGE_REL_NS}}}Relationship")
    }
    paths = {}
    for sheet in workbook_root.find(f"{{{MAIN_NS}}}sheets"):
        relationship_id = sheet.attrib[f"{{{REL_NS}}}id"]
        target = targets[relationship_id]
        paths[sheet.attrib["name"]] = target if target.startswith("xl/") else f"xl/{target}"
    return paths


def _column_name(number):
    name = ""
    while number:
        number, remainder = divmod(number - 1, 26)
        name = chr(65 + remainder) + name
    return name