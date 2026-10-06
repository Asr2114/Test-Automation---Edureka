*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../variables(data)/config.resource

*** Keywords ***
Open Application
    [Documentation]    Opens the configured application in the selected browser.
    Open Application At URL    ${BASE_URL}

Open Application At URL
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Maximize Browser Window

Close Application
    [Documentation]    Closes the active browser session.
    Close All Browsers

Capture Failure Screenshot
    [Documentation]    Saves a screenshot with a stable, timestamped Robot name.
    Capture Page Screenshot    ${SCREENSHOT_DIR}${/}failure-{index}.png

Wait Until Page Is Ready
    [Documentation]    Waits for the document to finish loading.
    Wait For Condition    return document.readyState === 'complete';    timeout=${EXPLICIT_WAIT}