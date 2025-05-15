*** Settings ***
Library    SeleniumLibrary
*** Test Cases ***
Validate Home Landing Page
    Open Browser    https://www.google.co.in    chrome
    Input Text      name:q    selenium
    Sleep    2s
    Click Button    xpath:(//input[@name='btnK'])[1]
    Sleep    2s
    Page Should Contain    selenium
    Sleep    10s
    Close Browser


