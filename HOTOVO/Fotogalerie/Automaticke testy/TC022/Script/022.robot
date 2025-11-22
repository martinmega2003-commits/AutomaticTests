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
    # uložíme handle původního okna
    @{all_handles}=    Get Window Handles
    ${main_handle}=    Set Variable    ${all_handles}[0]
    ${links}=         Get Fotogalerie Links
    FOR    ${link}    IN    @{links}
        Log    Testuji odkaz: ${link}
        Execute Javascript    window.open("${link}", "_blank")
        Wait Until Number Of Windows Is    2    timeout=10s
        @{new_handles}=    Get Window Handles
        FOR    ${h}    IN    @{new_handles}
            Run Keyword If    '${h}' != '${main_handle}'    Select Window    handle=${h}
        END
        Wait Until Page Contains Element    //body    timeout=10s
        ${title}=    Get Title
        Should Not Be Empty    ${title}
        Close Window
        Select Window    handle=${main_handle}
    END

*** Test Cases ***

Test Page Title Is Correct
    [Documentation]    Ověří, že se titul stránky shoduje s očekáváním.
    ${title}=    Get Title
    Should Be Equal    ${title}    Fotogalerie - Oficiální stránky města Dubňany

Test At Least Five Year Links Present
    [Documentation]    Ověří, že v levém menu je minimálně 5 odkazů na jednotlivé roky.
    @{links}=    Get Fotogalerie Links
    ${count}=    Get Length    ${links}
    Should Be True    ${count} >= 5    msg=Očekávalo se alespoň 5 odkazů, našlo se ${count}.
