*** Settings ***
Documentation    to validate the functioning of radio button
Library    SeleniumLibrary

*** Variables ***
${url}    https://demo.automationtesting.in/Register.html

*** Test Cases ***
Validate the radio buttons
    open the browser with url
    select impressive opsions from the radio button
    verify the radio button is selected

*** Keywords ***
open the browser with url
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5


select impressive opsions from the radio button
    Page Should Contain Radio Button    name:radiooptions
    Page Should Not Contain Radio Button    id:check1
    Select Radio Button    radiooptions    Male


verify the radio button is selected
    Radio Button Should Be Set To    radiooptions    Male