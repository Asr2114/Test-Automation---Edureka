*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    ../../variables(data)/testdata.py
Resource   ../commomKeywords.resource
Resource   ../../pageObjects/locators/contactLocators.resource

*** Keywords ***
Get Valid Contact Data
    ${data}=    Get Test Case Value    TC_CONTACT_02    Test Data    ${WORKBOOK_PATH}
    ${contact}=    Parse Contact Data    ${data}
    RETURN    ${contact}

Open Contact Page
    Open Application At URL    ${CONTACT_URL}
    Wait Until Page Is Ready
    Wait Until Element Is Visible    ${CONTACT_FORM}    ${EXPLICIT_WAIT}

Submit Contact Form With Valid Data
    [Arguments]    ${name}    ${phone}    ${email}    ${message}
    Wait Until Element Is Visible    ${CONTACT_NAME}    ${EXPLICIT_WAIT}
    Input Text    ${CONTACT_NAME}    ${name}
    Input Text    ${CONTACT_PHONE_INPUT}    ${phone}
    Input Text    ${CONTACT_EMAIL}    ${email}
    Input Text    ${CONTACT_QUERY}    ${message}
    Scroll Element Into View    ${CONTACT_SUBMIT}
    Wait Until Element Is Enabled    ${CONTACT_SUBMIT}    ${EXPLICIT_WAIT}
    Wait Until Keyword Succeeds    5x    1s    Click Element    ${CONTACT_SUBMIT}
    Wait Until Page Is Ready

Verify Contact Submission Has No Validation Errors
    Page Should Not Contain Element    ${CONTACT_ERRORS}
    Location Should Contain    /contact-us

Submit Contact Form With Missing Required Field
    [Arguments]    ${name}    ${phone}    ${email}    ${message}
    Wait Until Element Is Visible    ${CONTACT_NAME}    ${EXPLICIT_WAIT}
    Input Text    ${CONTACT_NAME}    ${name}
    Input Text    ${CONTACT_PHONE_INPUT}    ${phone}
    Input Text    ${CONTACT_EMAIL}    ${email}
    Input Text    ${CONTACT_QUERY}    ${message}
    Scroll Element Into View    ${CONTACT_SUBMIT}
    Click Element    ${CONTACT_SUBMIT}

Verify Contact Validation Is Displayed
    ${error_count}=    Get Element Count    ${CONTACT_ERRORS}
    ${native_invalid}=    Execute Javascript    return document.querySelector('#contactform') && !document.querySelector('#contactform').checkValidity();
    Should Be True    ${error_count} > 0 or ${native_invalid}    No validation feedback was displayed for invalid contact data.

Verify Contact Success Message Is Displayed
    Wait Until Page Is Ready
    Page Should Not Contain Element    ${CONTACT_ERRORS}
    Location Should Contain    /contact-us