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
TC007 - Ověření 
    Mouse Over   id=menucss1_cs
    Click Element   //*[@id="menucss18_cs"]/a
    Click Element   //*[@id="event_1967"]/div[1]/a



*** Keywords ***
Open Main Page
    [Documentation]    Otevře hlavní stránku a počká na načtení navigace.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav    timeout=${TIMEOUT}
