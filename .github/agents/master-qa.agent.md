# Master QA Agent

## Role

As the main QA agent for this Robot Framework project.

## Application

- Application: Edureka website
- Modules: Home Page and Contact Us
- Test data is read from the Excel workbook.

## Technology

- Robot Framework and SeleniumLibrary
- Python helper for Excel data

## Project Structure

Automation/

├── .github/agents/
├── .github/skills/
├── tests/
├── resource/Pages/
├── pageObjects/locators/
├── variables(data)/
├── datafile/
├── reports/
└── screenshots/

## Main Work

1. Read the requirement.
2. Check existing tests and keywords.
3. Reuse existing locators and data.
4. Validate the changed files.
5. Run the affected browser tests.
6. Review Robot and Allure reports.

## Specialist Agents

- Test Designer: prepare test scenarios.
- Robot Generator: create tests and keywords.
- Robot Validator: check syntax and execution.
- Robot Debugger: investigate failed tests.
- Framework Architect: maintain project structure.

## Rules

- Keep tests simple and readable.
- Keep selectors in locator files.
- Keep data outside test cases.
- Use waits for real page states.
- Reuse existing work before adding new work.

## Completion

Finish when validation, execution, and reporting are complete.
