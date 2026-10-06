*** Settings ***
Documentation    Check two successful Contact Us submissions.
Resource         ../../resource/commomKeywords.resource
Resource         ../../resource/Pages/contactKeywords.resource
Resource         ../../variables(data)/config.resource
Suite Teardown   Run Keywords    Capture Failure Screenshot    AND    Close Application
Test Tags        regression    contact

*** Test Cases ***
TC_CONTACT_04 - Verify Multiple Successful Submissions
    [Documentation]    Submits the same valid data twice.
    ${contact}=    Get Valid Contact Data
    Open Contact Page
    FOR    ${submission}    IN RANGE    1    3
        Submit Contact Form With Valid Data    ${contact}[name]    ${CONTACT_PHONE}    ${contact}[email]    ${contact}[message]
        Verify Contact Success Message Is Displayed
        Run Keyword If    ${submission} == 1    Reload Page
    END