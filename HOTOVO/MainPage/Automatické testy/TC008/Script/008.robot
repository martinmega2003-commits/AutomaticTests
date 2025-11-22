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
Odeslani ZpravY Pres Kontaktni Formular
    [Documentation]    Ověření funkce kontaktního formuláře města Dubňany s očekávanou chybou CAPTCHA
    Mouse Over         id=menucss29_cs
    Click Element      //*[@id="menucss139_cs"]/a
    Input Text         name=form[1]      Jan
    Input Text         name=form[2]      Novák
    Input Text         name=form[3]      jan.novak@example.com
    Input Text         name=form[4]      123 456 789
    Input Text         name=form[5]      Testovací zpráva
    Click Button       name=odeslat
    Wait Until Element Is Visible    xpath=//div[contains(@class, "status_error")]
    Element Should Contain    xpath=//div[contains(@class, "status_error")]    Formulář není vyplněn správně. Prosím opravte tato políčka
    Element Should Contain    xpath=//div[contains(@class, "status_error")]    Captcha
*** Keywords ***
Open Main Page
    [Documentation]    Otevře hlavní stránku a počká na načtení navigace.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav    timeout=${TIMEOUT}
