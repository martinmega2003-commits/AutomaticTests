*** Settings ***
Library           SeleniumLibrary
Library           Collections
Suite Setup       Open Browser To Fotogalerie
Suite Teardown    Close Browser
Test Setup        Go To Fotogalerie Page

Resource   ../../ObjectRepository/Url.robot


*** Keywords ***
Open Browser To Fotogalerie
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

Go To Fotogalerie Page
    Go To    ${BASE_URL}
    Wait Until Page Contains Element    css:nav#menu ul.root li a

Get Fotogalerie Links
    ${elements}=    Get WebElements    css:nav#menu ul.root li a
    @{links}=       Create List
    FOR    ${el}    IN    @{elements}
        ${href}=    Get Element Attribute    ${el}    href
        Append To List    ${links}    ${href}
    END
    [Return]    ${links}

Check That All Fotogalerie Links Open
    ${links}=    Get Fotogalerie Links
    FOR    ${link}    IN    @{links}
        Log    Testuji odkaz: ${link}
        Execute Javascript    window.open("${link}", "_blank");
        Switch Window    NEW
        Wait Until Page Contains Element    //body    timeout=10s
        ${title}=    Get Title
        Should Not Be Empty    ${title}
        GO back
    END

*** Test Cases ***
Test Fotogalerie Links Are Reachable
    Check That All Fotogalerie Links Open
