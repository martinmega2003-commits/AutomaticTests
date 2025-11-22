*** Settings ***
Documentation     Šablona Robot Framework testu
Library    SeleniumLibrary    run_on_failure=Nothing
Suite Setup       Open Main Page
Suite Teardown    Close Browser

Resource   ../../ObjectRepository/Url.robot


*** Test Cases ***
TC005 Kalendáře
    [Documentation]    Ověří výběr roku a kliknutí na konkrétní odkaz v kalendáři.
    [Tags]    kalendář    scroll    select
    # Posuňme na výběr roku
# Posuňme na výběr roku
    Scroll Element Into View    id=year
    Select From List By Value    id=year    2022
    ${selected}=    Get Selected List Value    id=year
    Should Be Equal    ${selected}    2022

    # Po reloadu kalendáře odstraníme překryv cookie banneru a scroll na den 26
    Execute JavaScript    document.getElementById('cookie_consent').remove();
    ${day_locator}=    Set Variable    xpath=//td[contains(@class,"act mesic")]/a[normalize-space(.)="26"]
    Wait Until Element Is Visible    ${day_locator}    timeout=${TIMEOUT}
    Scroll Element Into View    ${day_locator}
    Wait Until Element Is Enabled    ${day_locator}    timeout=${TIMEOUT}
    Click Element    ${day_locator}

    Wait Until Page Contains Element    css=body
*** Keywords ***
Open Main Page
    [Documentation]    Otevře hlavní stránku a počká na načtení navigace.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav    timeout=${TIMEOUT}
