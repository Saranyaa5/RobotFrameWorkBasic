*** Settings ***
Documentation     To access the dropdown and handle child window
Library           SeleniumLibrary
Task Teardown     Close Browser Session

*** Variables ***
${url}             https://demo.automationtesting.in/Windows.html
${main_window}     
${child_window}    

*** Test Cases ***
Handle Child Window
    Open The Browser With URL
    Select The Button To Switch To Child Window
    Verify The Child Window Is Opened
    Switch Back To Parent Window
    Switch Back To Child Window

*** Keywords ***
Open The Browser With URL
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Select The Button To Switch To Child Window
    ${all_before}=    Get Window Handles
    Set Suite Variable    ${main_window}    ${all_before[0]}
    Click Element     xpath://*[@id="Tabbed"]/a/button
    Sleep             2s
    ${all_after}=     Get Window Handles
    FOR    ${handle}    IN    @{all_after}
        Run Keyword If    '${handle}' != '${main_window}'    Set Suite Variable    ${child_window}    ${handle}
    END

Verify The Child Window Is Opened
    Switch Window    ${child_window}
    ${title}=        Get Title
    Log To Console   Child Window Title: ${title}

Switch Back To Parent Window
    Switch Window    ${main_window}
    ${title}=        Get Title
    Log To Console   Switched Back to Parent: ${title}

Switch Back To Child Window
    Switch Window    ${child_window}
    ${title}=        Get Title
    Log To Console   Switched Back to Child: ${title}

Close Browser Session
    Close Browser
