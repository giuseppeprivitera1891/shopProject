*** Settings ***
Variables    ../resources/Locators.py
Resource    ../resources/Commons.robot

*** Keywords ***
Search product
    [Arguments]    ${chooseProduct}
    ${elements} =   Get Webelements    ${listProducts}
    ${index} =  Set Variable    1
    FOR  ${element}  IN  @{elements}
        Exit For Loop If    '${chooseProduct}' == '${element.text}'
        ${index} =  Evaluate    ${index} + 1
    END
    Click Button    xpath:(//button[@class='btn btn-info'][normalize-space()='Add'])[${index}]

Add a product
    [Arguments]    ${chooseProduct}
    Wait Until Element Is Visible    ${listProducts}
    Search Product    ${chooseProduct}
    Sleep    2
    Click Element    ${checkoutProductButton}

Check the text of checkout button
    Scroll Element Into View    ${checkoutProductButton}
    Element Should Contain    ${checkoutProductButton}     ${checkoutTextButton}

*** Variables ***
${checkoutTextButton} =     c

