*** Settings ***
Library           SeleniumLibrary    timeout=10
Suite Setup       Open Main Page
Suite Teardown    Close Browser


Resource   ../../ObjectRepository/Url.robot


*** Test Cases ***
TC001-001 Ověření funkčnosti odkazů v horním menu
    [Documentation]    Každá položka horního menu přesměruje na odpovídající sekci.
    [Tags]    menu    navigation    regression

    # (Suite Setup už načetl stránku, není třeba Open Main Page)

    # 1) Úřad
    Click Link    xpath=//nav//a[normalize-space(.)='Úřad']
    Location Should Be    https://www.dubnany.eu/urad/
    Go Back

    # 2) Město
    Click Link    xpath=//nav//a[normalize-space(.)='Město']
    Location Should Be    https://www.dubnany.eu/mesto/
    Go Back

    # 3) Služby (Turistika)
    Click Link    xpath=//nav//a[normalize-space(.)='Služby']
    Location Should Be    https://www.dubnany.eu/sluzby/
    Go Back

    # 4) Kultura
    Click Link    xpath=//nav//a[normalize-space(.)='Kultura']
    Location Should Be    https://www.dubnany.eu/kultura/
    Go Back

    # 5) Fotogalerie
    Click Link    xpath=//nav//a[normalize-space(.)='Fotogalerie']
    Location Should Be    https://www.dubnany.eu/fotogalerie-1/
    Go Back

    # 6) Kontakt
    Click Link    xpath=//nav//a[normalize-space(.)='Kontakt']
    Location Should Be    https://www.dubnany.eu/kontakt/
    Go Back

    # 7) Volby 2024
    Click Link    xpath=//nav//a[normalize-space(.)='Volby 2024']
    Location Should Be    https://www.dubnany.eu/volby-2024/
    Go Back

    # 8) Projekty
    Click Link    xpath=//nav//a[normalize-space(.)='Projekty']
    Location Should Be    https://www.dubnany.eu/projekty/
    Go Back

*** Keywords ***
Open Main Page
    [Documentation]    Otevře hlavní stránku Dubňan v Chrome.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav
