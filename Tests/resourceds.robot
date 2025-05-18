*** Settings ***
Documentation    Aresource file with reusable keywords and variables
Library    SeleniumLibrary

*** Variables ***
${valid_username}    Admin
${valid_password}    admin123
${invlaid_username}    45678
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Keywords ***
Open the browser with url
    Create Webdriver    Chrome
    Go To    ${URL}
    Maximize Browser Window
    Set Selenium Implicit Wait    5
    
Close browser session
    Close Browser