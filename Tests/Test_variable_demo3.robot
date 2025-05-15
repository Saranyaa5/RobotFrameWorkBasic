*** Settings ***
Documentation       To validate the login form
Library             SeleniumLibrary
Library             Collections
Test Teardown       Close Browser session

*** Variables ***
${valid_username}    Admin
${valid_password}    admin123
${url}               https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
&{visibleElements}   Forgot your password?=css:.orangehrm-login-forgot-header

*** Test Cases ***
Validate Elements on Login Page
    Open the browser with url
    Verify Elements on login page

Validate Successful Login
    Open the browser with url
    Fill the login form
    Verify Dashboard page opens
    Verify items in dashboard page

*** Keywords ***
Open the browser with url
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Verify Elements on login page
    Element Should Be Visible    ${visibleElements["Forgot your password?"]}

Fill the login form
    Input Text        css:input[name="username"]    ${valid_username}
    Input Password    css:input[name="password"]    ${valid_password}
    Click Button      css:.orangehrm-login-button
    Sleep             2s

Verify Dashboard page opens
    Element Text Should Be    css:.oxd-topbar-header-breadcrumb-module    Dashboard

Verify items in dashboard page
    @{expectedlist}    Create List    Admin    PIM    Leave    Time    Recruitment    My Info    Performance    Dashboard    Directory    Maintenance    Claim    Buzz
    ${elements}        Get WebElements    css:.oxd-main-menu-item--name
    @{actuallist}      Create List
    FOR    ${element}    IN    @{elements}
        ${text}        Get Text    ${element}
        Append To List    ${actuallist}    ${text}
    END
    Should Be Equal    ${expectedlist}    ${actuallist}

Close Browser session
    Close Browser
