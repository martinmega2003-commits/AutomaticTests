*** Settings ***
Documentation     Šablona Robot Framework testu
Library    SeleniumLibrary    run_on_failure=Nothing
Suite Setup       Open Main Page
Suite Teardown    Close Browser

Resource   ../../ObjectRepository/Url.robot



*** Test Cases ***
TC006 Senioři
    [Documentation]    Ověří funkčnost zjednodušené verze pro seniory
    Wait Until Element Is Visible    id=cookies-consent-reject    timeout=${TIMEOUT}
    Click Element    id=cookies-consent-reject

    ${senior_link}=    Set Variable    xpath=//*[@id="left"]/div/div[3]/div/p[1]/span/a[1]
    Wait Until Element Is Visible    ${senior_link}    timeout=${TIMEOUT}
    Scroll Element Into View         ${senior_link}
    Sleep                            3s
    Click Element                    ${senior_link}
    Sleep                            3s



*** Keywords ***
Open Main Page
    [Documentation]    Otevře hlavní stránku a počká na načtení navigace.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav    timeout=${TIMEOUT}
