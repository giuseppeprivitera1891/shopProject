*** Settings ***
Variables    ../resources/Locators.py
Resource    ../resources/Commons.robot

*** Variables ***
${errorMessage}     incorrect
${expectedTextModal}     You will be limited to only fewer functionalities

*** Keywords ***
Enter correct credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${usernameInput}    ${username}
    Input Password    ${passwordInput}    ${password}
    Choice Type Of Account
    Accept The Terms
    Click Button    ${signInButton}

Get wrong message
    Wait Until Element Is Visible    ${wrongCredentials}
    Element Should Contain    ${wrongCredentials}   ${errorMessage}     ignore_case=True

Choice type of account
    Click Element    ${userRadioButton}
    Sleep    1
    Element Should Contain    ${messageModalLogin}      ${expectedTextModal}       ignore_case=True
    Click Button    ${okayButtonModal}
    Sleep    1

Accept the terms
    Click Element    ${acceptTerms}


    

