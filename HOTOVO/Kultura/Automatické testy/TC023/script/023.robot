*** Settings ***
Documentation     Šablona Robot Framework testu
Library    SeleniumLibrary    run_on_failure=Nothing
Suite Setup       Open Main Page
Suite Teardown    Close Browser

Resource   ../../ObjectRepository/Url.robot


*** Test Cases ***
Test přečtení nahlas
    Click Element   //*[@id="tts_wrap_0"]
    Sleep     1s



    

*** Keywords ***
Open Main Page
    [Documentation]    Otestuje vypnuti a zapnuti css stylu
    Open Browser    ${URL6}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    css=nav    timeout=${TIMEOUT}
