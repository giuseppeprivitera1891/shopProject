*** Settings ***
Variables    ../resources/Locators.py
Resource    ../resources/Commons.robot

*** Keywords ***
Search product
    [Arguments]    ${chooseProduct}
    ${elements} =   get webelements    ${listProducts}
    ${index} =  set variable    1
    FOR  ${element}  IN  @{elements}
        exit for loop if    '${chooseProduct}' == '${element.text}'
        ${index} =  evaluate    ${index} + 1
    END
    click button    xpath:(//button[@class='btn btn-info'][normalize-space()='Add'])[${index}]

Add a product
    [Arguments]    ${chooseProduct}
    sleep    5 seconds
    wait until element is visible       ${listProducts}
    search product  ${chooseProduct}
    click element    ${checkoutProductButton}

Check the text of checkout button
    scroll element into view    ${checkoutProductButton}
    element should contain    ${checkoutProductButton}     ${checkoutTextButton}

*** Variables ***
${checkoutTextButton} =     c

