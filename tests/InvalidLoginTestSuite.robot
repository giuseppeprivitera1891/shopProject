*** Settings ***
Resource    ../pages/Login.robot
Library    DataDriver    ../../PycharmProjects/shopProject/data/invalid.xlsx
Suite Setup  Open the browser
#Test Setup    Open the browser
#Test Teardown    Close the browser
Test Template    Invalid login
Suite Teardown    Close the browser

*** Test Cases ***
Test Case - Invalid login
    [Tags]    1  2  3
    Invalid login

*** Keywords ***
Invalid login
    [Arguments]    ${username}  ${password}
    input text   ${usernameInput}    ${username}
    input password   ${passwordInput}   ${password}
    click button    ${signInButton}
    get wrong message

