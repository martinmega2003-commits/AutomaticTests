*** Settings ***
Documentation     Šablona Robot Framework testu
Library    SeleniumLibrary    run_on_failure=Nothing
Suite Setup       Open Main Page
Suite Teardown    Close Browser

Resource   ../../ObjectRepository/Url.robot


*** Test Cases ***
TS009 - overeni fotogalerie
    Wait Until Element Is Visible    id=cookies-consent-reject    timeout=${TIMEOUT}
    Click Element    id=cookies-consent-reject
    Mouse Over   //*[@id="menucss79_cs"]/a
    Click Element   //*[@id="menucss237_cs"]/a
    Click Element   //*[@id="event_1901"]/p[2]/a
    click Element   //*[@id="gal_click_6677"]/img
    Wait Until Element Is Visible    xpath=//*[@id="gal_click_6677"]/img 
    Press Keys    NONE    \\27
    Click Element   //*[@id="menu199_cs"]/a
    Click Element   //*[@id="event_1919"]/p[2]/a
    Click Element   //*[@id="gal_click_6772"]
    Wait Until Element Is Visible    xpath=//*[@id="gal_click_6772"]
    sleep   1s
    Press Keys    NONE    \\27
*** Keywords ***
Open Main Page
    [Documentation]    Otevře fologalerii a vyzkousi obrazky
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav    timeout=${TIMEOUT}
