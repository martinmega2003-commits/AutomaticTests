*** Settings ***
Library    SeleniumLibrary    run_on_failure=Nothing
Suite Setup       Open Main Page
Suite Teardown    Close Browser

Resource   ../../ObjectRepository/Url.robot

*** Test Cases ***
Test All Links Are Reachable
    [Documentation]    Verifies that each link on the page does not lead to a 404 error
    ${anchors}=    Get WebElements    xpath=//a[@href]
    ${count}=      Get Length        ${anchors}
    Log            Found ${count} links on the page

    FOR    ${anchor}    IN    @{anchors}
        ${href}=    Get Element Attribute    ${anchor}    href
        # skip mailto: and javascript: links
        Run Keyword If    "'${href}'.startswith('mailto:')"    Continue For Loop
        Run Keyword If    "'${href}'.startswith('javascript:')"    Continue For Loop

        Log    Testing link: ${href}
        Go To    ${href}
        Title Should Not Contain    404
        Location Should Be          ${href}
        Go Back
    END

*** Keywords ***
Open Main Page
    [Documentation]    Opens the target page and maximizes the browser
    Open Browser        ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}
