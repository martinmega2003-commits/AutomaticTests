*** Settings ***
Library    SeleniumLibrary    run_on_failure=Nothing
Suite Setup       Open Main Page
Suite Teardown    Close Browser

Resource   ../../ObjectRepository/Url.robot

*** Test Cases ***
TC012 - Otevření všech PDF odkazů v projektech
    Click Element    xpath=//*[@id="menucss193_cs"]/a
    Wait Until Element Is Visible    css=#editor_content a.file    timeout=${TIMEOUT}
    ${links}=    Get WebElements    css=#editor_content a.file
    FOR    ${el}    IN    @{links}
        ${href}=    Get Element Attribute    ${el}    href
        Execute JavaScript    window.open("${href}", "_blank")
        Sleep    1s
    END

*** Keywords ***
Open Main Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav    timeout=${TIMEOUT}
