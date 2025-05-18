*** Settings ***
Documentation    Tests to login to login page
Library    SeleniumLibrary
Resource    resourceds.robot

*** Variables ***
${Login_error_message}    xpath://*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/div/div[1]/div[1]
${dashboard_Text}    css:#app > div.oxd-layout.orangehrm-upgrade-layout > div.oxd-layout-navigation > header > div.oxd-topbar-header > div.oxd-topbar-header-title > span > h6

*** Test Cases ***
validate unsuccessful login
    [Tags]    smoke    regression
    Open the browser with url
    Fill the login form    ${invlaid_username}    ${invlaid_username}
    verify error message is correct
    Close browser session

validate successful login
    [Tags]    smoke    regression
    Open the browser with url
    Fill the login form    ${invlaid_username}    ${invlaid_username}
    verify dashboard page opens
    Close browser session

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    css:input[name=username]    ${username}
    Input Password    css:input[name=password]    ${password}
    Click Button    css:.orangehrm-login-button

verify error message is correct
    Element Text Should Be    ${Login_error_message}    Invalid credentials

verify dashboard page opens
    Element Text Should Be    ${dashboard_Text}    Dashboard

