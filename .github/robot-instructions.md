# Robot Framework Instructions

## Role

Act as a Robot Framework engineer for this project.

## Technology

- Robot Framework
- SeleniumLibrary
- Keyword-driven tests

## Basic Flow

1. Discover the existing work.
2. Read the requirement.
3. Reuse existing assets.
4. Make a small change.
5. Validate the change.
6. Run the affected test.
7. Report the result.

## Framework Structure

- Tests belong in `tests/`.
- Business keywords belong in `resource/`.
- Page actions belong in `resource/Pages/`.
- Locators belong in `pageObjects/locators/`.
- Configuration belongs in `variables(data)/`.
- Test data belongs in `testdata.py` or `datafile/`.
- Results belong in `reports/` and `screenshots/`.

## Test Rules

- Use meaningful test names.
- Use a clear tag such as smoke, regression, positive, or negative.
- Keep each test focused on one business flow.
- Keep tests short and readable.
- Do not put locators in test cases.
- Do not hardcode changeable test data.
- Add assertions for expected results.

## Keyword Rules

- Give each keyword one clear job.
- Use names that a tester can understand.
- Keep Selenium commands inside resource files.
- Reuse common setup and teardown.
- Use arguments for values that may change.

## Locator Rules

- Keep one source for each locator.
- Prefer stable IDs, names, labels, or test attributes.
- Use CSS or XPath only when needed.
- Avoid unnecessary index-based locators.
- Review locators against the current page.
- Do not place locators in tests.

## Data Rules

- Keep URLs and timeouts in configuration.
- Keep test values in the workbook or data files.
- Keep valid and invalid data clearly named.
- Do not expose real secrets.

## Wait Rules

- Wait for visibility before interaction.
- Wait for enabled state before typing or clicking.
- Wait for text or location after navigation.
- Prefer state-based waits over `Sleep`.
- Use `Sleep` only when no reliable state is available.

## Validation Rules

- Run a Robot dry run after changes.
- Check resource imports and variable names.
- Check that keyword references are valid.
- Review screenshots and logs after failures.
- Fix the cause instead of hiding the failure.

## Reporting

- Generate Robot output, log, and report files.
- Store Allure results in `allure-results/` when required.
- Generate the Allure report from the fresh results.
- Report passed, failed, skipped, and blocked tests honestly.

## Final Check

The work is complete only after validation, execution, and reporting.
