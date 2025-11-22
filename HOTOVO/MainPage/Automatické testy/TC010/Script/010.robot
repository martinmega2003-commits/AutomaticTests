*** Settings ***
Documentation     Šablona Robot Framework testu
Library    SeleniumLibrary    run_on_failure=Nothing
Suite Setup       Open Main Page
Suite Teardown    Close Browser

Resource   ../../ObjectRepository/Url.robot

*** Test Cases ***
TC010 
    [Documentation]  Test vypnuti a zapnuti css

    Wait Until Element Is Visible    id=cookies-consent-reject    timeout=${TIMEOUT}
    Click Element    id=cookies-consent-reject
    Scroll Element Into View  xpath=//*[@id="footer_right"]/p[2]/a[1]
    Click Element   xpath=//*[@id="footer_right"]/p[2]/a[1]
    Click Element   xpath=//*[@id="zmena_vzhledu"]/ul/li[2]/a
    Scroll Element Into View  xpath=//*[@id="footer_right"]/p[2]/a[1]
    Click Element   xpath=//*[@id="footer_right"]/p[2]/a[1]
    Click Element   xpath=//*[@id="zmena_vzhledu"]/ul/li[1]/a




*** Keywords ***
Open Main Page
    [Documentation]    Otestuje vypnuti a zapnuti css stylu
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav    timeout=${TIMEOUT}
