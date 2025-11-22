*** Settings ***
Documentation     Šablona Robot Framework testu – Opravená a rozšířená verze
Library    SeleniumLibrary    run_on_failure=Nothing
Suite Setup       Open Main Page
Suite Teardown    Close Browser

Resource   ../../ObjectRepository/Url.robot


*** Test Cases ***
TC012 - ověření závad
    [Documentation]   Test nahlášení závad ve městě Dubňany

    Wait Until Element Is Visible    id=cookies-consent-reject    timeout=${TIMEOUT}
    Scroll Element into View         id=cookies-consent-reject
    Click Element                    id=cookies-consent-reject

    Wait Until Element Is Visible    xpath=//*[@id="left"]/div/div[5]/div/p/a/img    timeout=${TIMEOUT}
    Scroll Element into View         xpath=//*[@id="left"]/div/div[5]/div/p/a/img
    Click Element                    xpath=//*[@id="left"]/div/div[5]/div/p/a

    Wait Until Element Is Visible    xpath=//button[.//span[text()="Přidat hlášení"]]    timeout=${TIMEOUT}
    Scroll Element into View         xpath=//button[.//span[text()="Přidat hlášení"]]
    Sleep                             ${PAUSE}
    Click Element                    xpath=//button[.//span[text()="Přidat hlášení"]]

    Wait Until Page Contains Element    xpath=//h2[text()="Nové hlášení"]    timeout=${TIMEOUT}

    Scroll Element into View         xpath=//textarea[@class="input input-textarea newInput--input"]
    Click Element   xpath=//*[@id="root"]/div/main/div[1]/div/div/div/div/div[2]/section/form/div[1]/div[2]/div[2]/button
    Select From List By Value    xpath=//select[@class="input input-select newInput--input"]    1
    Input Text      xpath=//*[@id="root"]/div/main/div[1]/div/div/div/div/div[2]/section/form/label[2]/div[2]/textarea[2]     V testu přidáno přes Robot Framework
    Input Text      xpath=//input[@type="email"]    test@example.com
    Click Element   xpath=//*[@id="root"]/div/main/div[1]/div/div/div/div/div[2]/section/form/label[5]/span[1]/span
    Sleep           ${PAUSE}
    Sleep    5s
    click Element   xpath=//*[@id="root"]/div/main/div[1]/div/div/div/div/div[2]/section/form/div[2]/button[2]

*** Keywords ***
Open Main Page
    [Documentation]    Otevře hlavní stránku města Dubňany
    Open Browser      ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav    timeout=${TIMEOUT}
