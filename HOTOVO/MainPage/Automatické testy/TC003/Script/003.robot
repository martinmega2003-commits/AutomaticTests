*** Settings ***
Documentation     Šablona Robot Framework testu
Library    SeleniumLibrary    run_on_failure=Nothing
Suite Setup       Open Main Page
Suite Teardown    Close Browser


Resource   ../../ObjectRepository/Url.robot

*** Test Cases ***
TC000 odstranění cookies
   Wait Until Element Is Visible     id=cookies-consent-reject    timeout=${TIMEOUT}
    Click Element                     id=cookies-consent-reject
TC002-001 - Ověření funkčnosti vyhledávacího tlačítka
    Mouse Over   id=hledej
    Click Element   id=hledej
    Input text   id=hledej   Územní studie
    Press keys   id=hledej   ENTER
    Click Element   //*[@id="ft_casovy"]/tbody/tr[3]/td[2]/a
    Wait Until Page Contains   Územní studie 
    Page Should Contain Element   //*[@id="editor_content"]/p[2]/a



*** Keywords ***
Open Main Page
    [Documentation]    Otevře hlavní stránku a počká na načtení navigace.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav    timeout=${TIMEOUT}
