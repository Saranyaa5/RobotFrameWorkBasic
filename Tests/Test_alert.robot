*** Settings ***
Documentation     To access the alert and verify its presence
Library           SeleniumLibrary
Task Teardown     Close Browser Session

*** Variables ***
${url}                      https://demo.automationtesting.in/Alerts.html
${simple_button}            xpath://*[@id="OKTab"]/button
${confirm_alt_tab}          xpath://a[contains(text(),'Alert with OK & Cancel')]
${confirm_button}           css:#CancelTab > button
${confirm_result}           id:demo
${text_alt_tab}             xpath://a[contains(text(),'Alert with Textbox')]
${prompt_button}            css:#Textbox > button
${prompt_result}            id:demo1

*** Test Cases ***
Handle All Types Of Alerts
    Open The Browser With URL
    Handle Simple Alert
    Handle Confirmation Alert
    Handle Prompt Alert

*** Keywords ***
Open The Browser With URL
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Handle Simple Alert
    Click Element    ${simple_button}
    ${alert_msg}=    Handle Alert
    Log To Console   Simple Alert Message: ${alert_msg}
    Sleep    3s

Handle Confirmation Alert
    Click Element    ${confirm_alt_tab}
    Click Element    ${confirm_button}
    ${confirm_msg}=    Handle Alert
    Log To Console     Confirm Alert Message: ${confirm_msg}
    Sleep    3s
    Click Element    ${confirm_button}
    Handle Alert     action=DISMISS
    Sleep    3s

Handle Prompt Alert
    Click Element    ${text_alt_tab}
    Click Element    ${prompt_button}
    Input Text Into Alert    Hello SARANYA
    Page Should Contain    Hello SARANYA
    Sleep    3s
    Click Element    ${prompt_button}
    Input Text Into Alert    Hello SARANYA
    Sleep    3s

Close Browser Session
    Close Browser
