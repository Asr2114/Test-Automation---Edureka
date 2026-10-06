# Skill

Debug Failures

## Purpose

Find the real reason a Robot test failed.

## Inspect

- Robot log
- Output XML
- Failure screenshot
- Current page and browser

## Check

- URL and browser state
- Setup and cleanup
- Frames and overlays
- Locator and wait condition
- Workbook data

## Process

1. Read the first real error.
2. Reproduce one focused test.
3. Fix the resource that owns the problem.
4. Rerun the focused test.
5. Rerun nearby tests after shared changes.

## Output

- Cause of failure
- File that was changed
- Test result
- Remaining environment issue
