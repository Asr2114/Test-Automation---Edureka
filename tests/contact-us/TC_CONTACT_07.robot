*** Settings ***
Documentation    Check validation for an invalid email.
Resource         ../../resource/commomKeywords.resource
Resource         ../../resource/Pages/contactKeywords.resource
Resource         ../../variables(data)/config.resource
Suite Teardown   Run Keywords    Capture Failure Screenshot    AND    Close Application
Test Tags        regression    contact

*** Test Cases ***
TC_CONTACT_07 - Verify Invalid Email Validation
    [Documentation]    Checks validation feedback for an invalid email.
    ${contact}=    Get Valid Contact Data
    Set To Dictionary    ${contact}    email=abc@
    Open Contact Page
    Submit Contact Form With Missing Required Field    ${contact}[name]    ${CONTACT_PHONE}    ${contact}[email]    ${contact}[message]
    Verify Contact Validation Is Displayed
