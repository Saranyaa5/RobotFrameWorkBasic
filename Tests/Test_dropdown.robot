*** Settings ***
Documentation     To access the dropdown and print number of options
Library           SeleniumLibrary
Task Teardown    close browser session

*** Variables ***
${url}            https://demo.automationtesting.in/Register.html
${select_xpath}   //*[@id="Skills"]

*** Test Cases ***
Select Option In The Dropdown
    Open The Browser With URL
    Print The Length Of Dropdown

*** Keywords ***
Open The Browser With URL
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Print The Length Of Dropdown
    ${options}=    Get List Items    xpath:${select_xpath}
    ${length}=     Get Length    ${options}
    Log To Console    ${options}
    Log To Console    ${length}
    # Print   ${options}


close browser session
    Close Browser