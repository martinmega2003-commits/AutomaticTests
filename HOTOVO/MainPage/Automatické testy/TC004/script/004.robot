*** Settings ***
Documentation     Šablona Robot Framework testu
Library           SeleniumLibrary    timeout=10
Suite Setup       Open Main Page
Suite Teardown    Close Browser

Resource   ../../ObjectRepository/Url.robot

*** Test Cases ***
TC004 Ověření vrácení se na hlavní stránku pomocí loga

    Click Element   class=logo
    Page Should Contain Element   //*[@id="widget_5"]/div/p[1]




*** Keywords ***
Open Main Page
    [Documentation]    Otevře hlavní stránku a počká na načtení navigace.
    Open Browser    ${URL1}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav    timeout=${TIMEOUT}
