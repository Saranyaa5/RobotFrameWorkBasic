*** Settings ***
Documentation    to validate the functioning of radio button
Library    SeleniumLibrary
Test Teardown    close browser session

*** Variables ***
${url}    https://demo.automationtesting.in/Register.html

*** Test Cases ***
Validate the radio buttons
    open the browser with url
    verify page contain checkbox
    select the checkbox option cricket and hockey
    unselect the checkbox option hockey
    verify checkbox option cricket is selected
    verify checkox option hockey is not selected

*** Keywords ***
open the browser with url
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5

verify page contain checkbox
    Page Should Contain Checkbox    type:checkbox

select the checkbox option cricket and hockey
    Select Checkbox    id:checkbox1
    Select Checkbox    id:checkbox3
    Checkbox Should Be Selected    id:chexkbox1
    Checkbox Should Be Selected    id:chexkbox3

unselect the checkbox option hockey
    Unselect Checkbox    id:checkbox3
    

verify checkbox option cricket is selected
    Checkbox Should Be Selected    id:chexkbox1

verify checkox option hockey is not selected
    Checkbox Should Not Be Selected    id:chexkbox3

close browser session
    Close Browser