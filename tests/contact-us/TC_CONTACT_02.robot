*** Settings ***
Documentation    Check a valid Contact Us form submission.
Resource         ../../resource/commomKeywords.resource
Resource         ../../resource/Pages/contactKeywords.resource
Resource         ../../variables(data)/config.resource
Suite Teardown   Run Keywords    Capture Failure Screenshot    AND    Close Application
Test Tags        smoke    contact

*** Test Cases ***
TC_CONTACT_02 - Verify Valid Contact Submission
    [Documentation]    Submits valid data from the workbook.
    ${contact}=    Get Valid Contact Data
    Open Contact Page
    Submit Contact Form With Valid Data    ${contact}[name]    ${CONTACT_PHONE}    ${contact}[email]    ${contact}[message]
    Verify Contact Success Message Is Displayed
