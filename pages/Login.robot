*** Settings ***
Variables    ../resources/Locators.py
Resource    ../resources/Commons.robot

*** Variables ***
${errorMessage}     incorrect
${expectedTextModal}     You will be limited to only fewer functionalities

*** Keywords ***
Enter correct credentials
    [Arguments]    ${username}    ${password}
    input text    ${usernameInput}    ${username}
    input password    ${passwordInput}    ${password}
    choice type of account
    accept the terms
    click button    ${signInButton}

Get wrong message
    wait until element is visible    ${wrongcredentials}
    element should contain    ${wrongCredentials}   ${errormessage}     ignore_case=True

Choice type of account
    click element   ${userRadioButton}
    wait until element is visible    ${okayButtonModal}
    element should contain    ${messageModalLogin}      ${expectedTextModal}       ignore_case=True
    click button    ${okayButtonModal}

Accept the terms
    wait until element is visible    ${acceptTerms}
    click element   ${acceptTerms}


    

