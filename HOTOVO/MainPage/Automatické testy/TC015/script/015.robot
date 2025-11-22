*** Settings ***
Library           SeleniumLibrary    run_on_failure=Nothing
Suite Setup       Open Browser    ${URL}    chrome    maximized=True
Suite Teardown    Close Browser
Test Setup        Go To    ${URL}

Resource          ../../ObjectRepository/Url.robot


*** Test Cases ***
TC015 Kontrola favicon loga
    [Documentation]    Kontrola, že stránka obsahuje obrázek loga se src "/skins/dubnany2/images/logo.png" a alt "Oficiální stránky města Dubňany"
    Wait Until Element Is Visible    xpath=//img[@src='/skins/dubnany2/images/logo.png' and @alt='Oficiální stránky města Dubňany']    timeout=10s

TC016 Kontrola loga a odkazu
    [Documentation]    Kontrola, že obrázek loga má správný alt text a odkaz vede na úvodní stránku
    Wait Until Element Is Visible    css=a.logo img    timeout=10s
    ${logo_alt}=    Get Element Attribute    css=a.logo img    alt
    Should Be Equal    ${logo_alt}    Oficiální stránky města Dubňany
    ${logo_href}=    Get Element Attribute    css=a.logo    href
    Should Contain    ${logo_href}    ${URL}

TC017 Kontrola vyhledávacího pole
    [Documentation]    Kontrola, že vyhledávací pole má placeholder "Hledaný výraz"
    Wait Until Element Is Visible    css=#hledej    timeout=10s
    ${placeholder}=    Get Element Attribute    css=#hledej    placeholder
    Should Be Equal    ${placeholder}    Hledaný výraz

TC018 Kontrola kontaktních údajů
    [Documentation]    Kontrola, že box s kontaktními údaji obsahuje název úřadu a e-mail
    Wait Until Element Is Visible    css=.leftbox.editor    timeout=10s
    ${contact_text}=    Get Text    css=.leftbox.editor
    Should Contain    ${contact_text}    Městský úřad Dubňany
    Should Contain    ${contact_text}    sekretariat@dubnany.eu

TC019 Kontrola položky menu "Úřad"
    [Documentation]    Kontrola, že hlavní menu obsahuje odkaz na sekci "Úřad"
    Wait Until Element Is Visible    xpath=//*[@id='menucss2_cs']/a    timeout=10s
    ${office_href}=    Get Element Attribute    xpath=//*[@id='menucss2_cs']/a    href
    Should End With    ${office_href}    /urad/

TC020 Kontrola panelu s kontaktními údaji
    [Documentation]    Kontrola, že v levém panelu existuje element .editor_mini s kompletními informacemi o městském úřadu
    Wait Until Element Is Visible    css=.editor_mini    timeout=10s
    ${editor_text}=    Get Text    css=.editor_mini
    Should Contain    ${editor_text}    Městský úřad Dubňany
    Should Contain    ${editor_text}    IČO: 00284882
    Should Contain    ${editor_text}    ID datové schránky: dr5bejn
