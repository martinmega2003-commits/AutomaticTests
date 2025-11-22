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
TC022 Test interakce s kalendářem
    Wait Until Element Is Visible    css=.kalendar-6    timeout=10s
    # Klik na šipku 'další' podle alt atributu, ne title
    Click Element    xpath=//form[@id='kalform']//input[@alt='další']
    Sleep    1s    # počkat na AJAX reload
    ${next_month}=    Execute JavaScript    return document.querySelector('#month').value;
    ${current_month}=    Execute JavaScript    return new Date().getMonth()+1;
    Should Not Be Equal    ${next_month}    ${current_month}

TC023 Test návratu do předchozího měsíce v kalendáři
    [Documentation]    Kontrola, že tlačítko pro návrat na předchozí měsíc funguje
    Go To    https://www.dubnany.eu/
    Wait Until Element Is Visible    css=.kalendar-6    timeout=10s
    ${current_month}=    Execute JavaScript    return document.querySelector('#month').value;
    # Použijeme JS click, aby se předešlo intercept problému
    Execute JavaScript    document.querySelector("form#kalform input[alt*='ředchozí']").click();
    Sleep    1s
    ${prev_month}=    Execute JavaScript    return document.querySelector('#month').value;
    Should Not Be Equal As Integers    ${prev_month}    ${current_month}

TC024 Test změny roku v kalendáři
    Wait Until Element Is Visible    css=.kalendar-6    timeout=10s
    Select From List By Value    css=#year    2024
    Sleep    1s    # počkat na AJAX reload
    ${selected_year}=    Get Selected List Value    css=#year
    Should Be Equal    ${selected_year}    2024


TC025 Test počtu dní v měsíci
    Run Keyword And Ignore Error    Click Element    css=#cookie_consent button.accept
    [Documentation]    Kontrola, že kalendář zobrazuje správný počet dní pro vybraný měsíc (únor 2025)
    Select From List By Value    css=#month    2
    Select From List By Value    css=#year    2025
    Sleep    1s    # počkat na AJAX redraw
    # Spočítat buňky se třídou 'mesic' (aktuální měsíc)
    ${day_cells}=    Get Element Count    xpath=//div[@id='kal_table']//td[contains(@class,'mesic')]
    Should Be Equal As Integers    ${day_cells}    28


*** Keywords ***
Open Main Page
    [Documentation]    Otevře fologalerii a vyzkousi obrazky
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav    timeout=${TIMEOUT}
