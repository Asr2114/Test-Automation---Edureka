*** Settings ***
Documentation    Check navigation from Home Page to Contact Us.
Resource         ../../resource/commomKeywords.resource
Resource         ../../resource/Pages/homeKeywords.resource
Resource         ../../variables(data)/config.resource
Suite Teardown   Run Keywords    Capture Failure Screenshot    AND    Close Application
Test Tags        regression    home

*** Test Cases ***
TC_HOME_05 - Verify Navigation Menu Links
    [Documentation]    Opens Home Page and selects Contact Us.
    Open Home Page
    Open Contact Us From Navigation
    Page Should Contain    Contact