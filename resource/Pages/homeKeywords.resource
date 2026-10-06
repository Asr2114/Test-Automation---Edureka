*** Settings ***
Library    SeleniumLibrary
Resource   ../commomKeywords.resource
Resource   ../../pageObjects/locators/homeLocators.resource

*** Keywords ***
Open Home Page
    Open Application At URL    ${BASE_URL}
    Verify Edureka Home Page Is Loaded    Home page should open successfully

Verify Edureka Home Page Is Loaded
    [Arguments]    ${expected_result}
    Wait Until Page Is Ready
    Page Should Contain Element    ${HOME_BODY}
    Page Should Contain    Edureka
    ${title}=    Get Title
    Should Contain    ${title}    Edureka
    Log    Workbook expectation: ${expected_result}

Open Contact Us From Navigation
    Wait Until Element Is Visible    ${CONTACT_LINK}    ${EXPLICIT_WAIT}
    Wait Until Keyword Succeeds    5x    1s    Click Element    ${CONTACT_LINK}
    Wait Until Page Is Ready
    Location Should Contain    /contact-us

Reload Home Page And Verify It Loads
    Reload Page
    Verify Edureka Home Page Is Loaded    Page should reload successfully without any error

Verify Edureka Logo Is Visible
    Wait Until Element Is Visible    ${HOME_LOGO}    ${EXPLICIT_WAIT}
    Element Should Be Visible    ${HOME_LOGO}

Verify Home Page Content Sections Are Present
    Wait Until Element Is Visible    ${HOME_BODY}    ${EXPLICIT_WAIT}
    Page Should Contain Element    ${HOME_IMAGES}
    Page Should Contain    Edureka

Verify Home Page Links Are Available
    ${link_count}=    Get Element Count    ${HOME_LINKS}
    Should Be True    ${link_count} > 0    No navigable links were found on the home page.
    ${invalid_count}=    Execute Javascript    return Array.from(document.querySelectorAll('body a[href]')).filter(link => !link.getAttribute('href') || link.getAttribute('href').trim().startsWith('javascript:')).length;
    Should Be Equal As Integers    ${invalid_count}    0    A home-page link has an empty or unsupported target.

Verify Home Page In Browser
    [Arguments]    ${browser}
    Open Browser    ${BASE_URL}    ${browser}
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Maximize Browser Window
    Verify Edureka Home Page Is Loaded    Website should function properly in ${browser}