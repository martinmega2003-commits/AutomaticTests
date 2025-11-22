*** Settings ***
Documentation     Šablona Robot Framework testu
Library           SeleniumLibrary    timeout=10s
Suite Setup       Open Main Page
Suite Teardown    Close Browser

Resource   ../../ObjectRepository/Url.robot


*** Test Cases ***
TC000 Odstranění cookies
    [Documentation]    Zavře banner cookies
    Wait Until Element Is Visible    id=cookies-consent-reject    timeout=${TIMEOUT}
    Click Element    id=cookies-consent-reject
    Sleep    ${TIMEOUT}

*** Test Cases ***
TC032_1 Ověření textů v levém menu Úřad
    [Documentation]    Kontrola, že se v levém menu zobrazují všechny očekávané položky
    ${expected_items}=    Create List
    ...    Odbory MěÚ Dubňany
    ...    Elektronická podatelna
    ...    Úřední deska
    ...    Platné vyhlášky a nařízení
    ...    Dokumenty a formuláře ke stažení
    ...    Povinně zveřejňované informace
    ...    Žádost o poskytnutí informace
    ...    Poskytnuté informace
    ...    Informace o zpracování osobních údajů
    ...    Rozpočet města
    ...    Územní plán
    ...    Územní studie
    ...    Informace o výkonu sociálně-právní ochrany dětí
    ...    Bezplatná místní autobusová doprava pro seniory
    ...    Informace o COVID-19
    ...    Obce pomáhají Ukrajině
    Wait Until Element Is Visible    css=aside#left nav ul li a    timeout=${TIMEOUT}
    @{elements}=    Get WebElements    css=aside#left nav ul li a
    ${count}=    Get Length    ${elements}
    Should Be Equal As Integers    ${count}    16    msg=Počet položek v menu neodpovídá očekávanému
    FOR    ${idx}    IN RANGE    ${count}
        ${el}=    Set Variable    ${elements}[${idx}]
        ${text}=    Get Text    ${el}
        ${exp}=    Set Variable    ${expected_items}[${idx}]
        Should Be Equal    ${text}    ${exp}    msg=Text na pozici ${idx} se neshoduje
    END

TC032_3 Ověření shody textů a odkazů v levém menu Úřad
    [Documentation]    Kontrola, že text položky odpovídá správnému href podle předem daného seznamu
    ${expected_items}=    Create List
    ...    Odbory MěÚ Dubňany
    ...    Elektronická podatelna
    ...    Úřední deska
    ...    Platné vyhlášky a nařízení
    ...    Dokumenty a formuláře ke stažení
    ...    Povinně zveřejňované informace
    ...    Žádost o poskytnutí informace
    ...    Poskytnuté informace
    ...    Informace o zpracování osobních údajů
    ...    Rozpočet města
    ...    Územní plán
    ...    Územní studie
    ...    Informace o výkonu sociálně-právní ochrany dětí
    ...    Bezplatná místní autobusová doprava pro seniory
    ...    Informace o COVID-19
    ...    Obce pomáhají Ukrajině
    ${expected_links}=    Create List
    ...    https://www.dubnany.eu/urad/odbory-meu-dubnany/
    ...    https://www.dubnany.eu/urad/elektronicka-podatelna/
    ...    https://www.dubnany.eu/urad/uredni-deska/
    ...    https://www.dubnany.eu/urad/platne-vyhlasky-a-narizeni-1/
    ...    https://www.dubnany.eu/urad/dokumenty-a-formulare-ke-stazeni/
    ...    https://www.dubnany.eu/urad/povinne-zverejnovane-informace/
    ...    https://www.dubnany.eu/urad/zadost-o-poskytnuti-informace/
    ...    https://www.dubnany.eu/urad/poskytnute-informace/
    ...    https://www.dubnany.eu/urad/informace-o-zpracovani-osobnich-udaju/
    ...    https://www.dubnany.eu/urad/rozpocet-mesta/
    ...    https://www.dubnany.eu/urad/uzemni-plan/
    ...    https://www.dubnany.eu/urad/uzemni-studie/
    ...    https://www.dubnany.eu/urad/informace-o-vykonu-socialne-pravni-ochrany-deti/
    ...    https://www.dubnany.eu/urad/bezplatna-mistni-autobusova-doprava-pro-seniory/
    ...    https://www.dubnany.eu/urad/informace-o-covid-19/
    ...    https://www.dubnany.eu/urad/obce-pomahaji-ukrajine/
    Wait Until Element Is Visible    css=aside#left nav ul li a    timeout=${TIMEOUT}
    @{elements}=    Get WebElements    css=aside#left nav ul li a
    ${count}=    Get Length    ${elements}
    Should Be Equal As Integers    ${count}    16    msg=Počet položek v menu neodpovídá očekávanému
    FOR    ${idx}    IN RANGE    ${count}
        ${el}=            Set Variable    ${elements}[${idx}]
        ${text}=          Get Text    ${el}
        ${href}=          Get Element Attribute    ${el}    href
        ${exp_text}=      Set Variable    ${expected_items}[${idx}]
        ${exp_href}=      Set Variable    ${expected_links}[${idx}]
        Should Be Equal    ${text}    ${exp_text}    msg=Text na pozici ${idx} se neshoduje
        Should Be Equal    ${href}    ${exp_href}    msg=Href na pozici ${idx} se neshoduje
    END

*** Keywords ***
Open Main Page
    [Documentation]    Otevře stránku Úřad města Dubňany
    Open Browser    ${URL2}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav    timeout=${TIMEOUT}
