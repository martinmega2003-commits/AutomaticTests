*** Settings ***
Library    SeleniumLibrary

Suite Setup      Open Browser And Prepare Page
Suite Teardown   Close Browser


Resource   ../../ObjectRepository/Url.robot

*** Test Cases ***
Title Should Be Correct
    [Documentation]    Ověří, že se titul stránky shoduje s očekávaným
    Title Should Be    Služby - Oficiální stránky města Dubňany

Menu Contains Services Link
    [Documentation]    Ověří, že v hlavním menu je odkaz na Služby
    Page Should Contain Element    xpath=//nav//a[contains(text(),'Služby')]

Service Link Is Clickable
    [Documentation]    Zkontroluje, že odkaz na "Městská knihovna" funguje
    Click Link    xpath=//*[@id="mapa_webu"]/ul/li[2]/a
    Wait Until Location Contains    /sluzby/mestska-knihovna/
    Go Back

Contact Section Is Present
    [Documentation]    Ověří, že je na stránce sekce Kontakt a obsahuje e-mail
    Scroll Element into View     xpath=//*[@id="left"]/div/div[1]/div/p[1]
    Page Should Contain Element    xpath=//*[@id="left"]/div/div[1]/h3/span
    Page Should Contain    sekretariat@dubnany.eu

*** Keywords ***
Open Browser And Prepare Page
    [Documentation]    Otevře prohlížeč, načte URL a odstraní banner cookies, pokud je přítomen
    Open Browser    ${URL5}    ${BROWSER}
    Maximize Browser Window
    # Pokusíme se přijmout cookies, ale nevyhodnotí chybu, pokud banner není
    Run Keyword And Ignore Error    Wait Until Element Is Visible    xpath=//button[contains(text(),'Souhlas') or contains(text(),'Rozumím')]    timeout=5s
    Run Keyword And Ignore Error    Click Button    xpath=//button[contains(text(),'Souhlas') or contains(text(),'Rozumím')]
    # Odstraňujeme všechny prvky související s cookies bannerem pomocí JavaScriptu
    Execute JavaScript    var xp = document.evaluate("//button[contains(text(), 'Souhlas') or contains(text(), 'Rozumím')]", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    ...    for(var i=0;i<xp.snapshotLength;i++){ xp.snapshotItem(i).remove(); }
    ...    document.querySelectorAll("[class*='cookie'], [id*='cookie']").forEach(function(el){el.remove();});
