*** Settings ***
Documentation    Check links on the Home Page.
Resource         ../../resource/commomKeywords.resource
Resource         ../../resource/Pages/homeKeywords.resource
Resource         ../../variables(data)/config.resource
Suite Teardown   Run Keywords    Capture Failure Screenshot    AND    Close Application
Test Tags        regression    home

*** Test Cases ***
TC_HOME_06 - Verify Home Page Links
    [Documentation]    Checks that Home Page links have usable targets.
    Open Home Page
    Verify Home Page Links Are Available
