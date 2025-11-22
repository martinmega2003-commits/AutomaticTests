*** Settings ***
Documentation     Nezávazné testy pro seniorskou verzi Dubňan
Library           SeleniumLibrary    timeout=10
Suite Setup       Open Seniors Page
Suite Teardown    Close Browser

Resource   ../../ObjectRepository/Url.robot


*** Test Cases ***
TC014 – Ověření ovládání velikosti písma
    [Documentation]   Testuje tlačítka zvětšení, zmenšení a resetu písma
    Wait Until Element Is Visible    id=but_big    timeout=${TIMEOUT}
    Click Element                    id=but_big
    Sleep                             ${PAUSE}
    Element Text Should Be           id=font_size    110 %
    Click Element                    id=but_small
    Sleep                             ${PAUSE}
    Element Text Should Be           id=font_size    100 %
    Click Element                    id=but_big
    Click Element                    id=but_def
    Sleep                             ${PAUSE}
    Element Text Should Be           id=font_size    100 %

TC015 – Kontrola základních karet v seznamu
    [Documentation]   Ověřuje, že se zobrazují karty „Úřední deska“, „Sportovní spolky“ a „Kontakt"
    Wait Until Element Is Visible    id=polozky_list    timeout=${TIMEOUT}
    Page Should Contain Element      id=sec_detail_href_1
    Page Should Contain Element      id=sec_detail_href_2
    Page Should Contain Element      id=sec_detail_href_11
    Element Text Should Be           xpath=//a[@id="sec_detail_href_1"]//div[@class="card-title"]    Úřední deska
    Element Text Should Be           xpath=//a[@id="sec_detail_href_2"]//div[@class="card-title"]    Sportovní spolky
    Element Text Should Be           xpath=//a[@id="sec_detail_href_11"]//div[@class="card-title"]   Kontakt


TC016 – Ověření přepnutí na standardní web
    [Documentation]   Kliknutí na odkaz „Přepnout na standardní web“ a kontrola URL
    Wait Until Element Is Visible    css=a.snr-home-link    timeout=${TIMEOUT}
    Click Element                    css=a.snr-home-link
    Sleep                             ${PAUSE}
    ${loc}=    Get Location
    Should Not Contain               ${loc}    /seniori/
    Page Should Contain               Město Dubňany

*** Keywords ***
Open Seniors Page
    [Documentation]   Otevře místní soubor seniorské verze
    Open Browser      ${URL3}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    css=h1.snr-h1    timeout=${TIMEOUT}
