*** Settings ***
Library    SeleniumLibrary    run_on_failure=Nothing
Suite Setup       Open Main Page
Suite Teardown    Close Browser


Resource   ../../ObjectRepository/Url.robot
*** Test Cases ***
TC001-003 Hover a klik na Platné vyhlášky a nařízení
    [Documentation]    Najede myší na „Úřad“, zobrazí se podmenu a klikne na „Platné vyhlášky a nařízení“.
    [Tags]    menu    navigation

    # 1) Najet myší na položku Úřad
    Mouse Over    xpath=//nav//a[normalize-space(.)='Úřad']
    Wait Until Element Is Visible    xpath=//nav//a[normalize-space(.)='Úřad']/following-sibling::ul//a[normalize-space(.)='Platné vyhlášky a nařízení']

    # 2) Klik na „Platné vyhlášky a nařízení“
    Click Link    xpath=//nav//a[normalize-space(.)='Úřad']/following-sibling::ul//a[normalize-space(.)='Platné vyhlášky a nařízení']

    # 3) Ověřit přesměrování
    Location Should Be    https://www.dubnany.eu/urad/platne-vyhlasky-a-narizeni-1/

*** Keywords ***
Open Main Page
    [Documentation]    Otevře hlavní stránku Dubňan v Chrome.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav
