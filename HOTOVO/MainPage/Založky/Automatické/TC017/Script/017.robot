*** Settings ***
Documentation     Šablona Robot Framework testu
Library    SeleniumLibrary    run_on_failure=Nothing
Suite Setup       Open Main Page
Suite Teardown    Close Browser

Resource   ../../ObjectRepository/Url.robot



*** Test Cases ***
Cookie
    Wait Until Element Is Visible    id=cookies-consent-reject    timeout=${TIMEOUT}
    Click Element    id=cookies-consent-reject

Otevreni_stranky_Aktuality
    Scroll Element into View  xpath=//*[@id="tabs_39"]
    Click Element   xpath=//*[@id="tabs_39"]/li[1]/a
     Wait Until Element Is Visible    xpath=//div[@id="widget_42"]    10s
    # Klikni na odkaz v první položce feedu
    Click Element    xpath=(//div[@id="widget_42"]//div[contains(@class,"feed_item")])[1]//p[@class="item_name"]/a
    Go back
Overení funkcnosti Kalendáře akcí
    Wait until element is Visible   xpath=//*[@id="tabs_39"]
    click element   xpath=//*[@id="tabs_39"]/li[2]/a
    Click Element    xpath=(//div[@id="widget_43"]//div[contains(@class,"feed_item")])[1]//p[@class="item_name"]/a
    # Ověř, že se otevřela stránka detailu (např. podle názvu první akce)
    Sleep   3s
    go back

Overeni funkcnosti Uřední desky
    Wait until element is Visible   xpath=//*[@id="tabs_39"]/li[3]
    Click Element    xpath=//*[@id="tabs_39"]/li[3]/a
    Click Element    xpath=(//div[@id="panes_39"]/div[not(contains(@style,'display: none'))]//div[contains(@class,'feed_item')])[1]//p[@class="item_name"]/a

*** Keywords ***
Open Main Page
    [Documentation]    Otevře fologalerii a vyzkousi obrazky
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav    timeout=${TIMEOUT}
