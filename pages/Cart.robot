*** Settings ***
Variables    ../resources/Locators.py
Resource    ../resources/Commons.robot

*** Variables ***
${productTextStatus} =  in stock
${removeTextButton} =   remove
${checkoutTextButton} =   checkout
${backShopPageTextButton} =    continue shopping
${successTextMessage} =     success

*** Keywords ***
Checks the elements in the cart page before
    element text should be    ${productStatus}      ${productTextStatus}    ignore_case=True
    page should contain element    ${totalPrice}
    element text should be      ${removeButton}     ${removeTextButton}     ignore_case=True
    element text should be    ${backShopPage}   ${backShopPageTextButton}   ignore_case=True

Checks the elements in the cart page after
    page should not contain element    ${productStatus}
    page should not contain button    ${removeButton}

Back to shop page
    element should be enabled    ${backShopPage}
    click button    ${backShopPage}

Remove a product
    checks the elements in the cart page before
    element should be enabled   ${removeButton}
    click button    ${removeButton}
    checks the elements in the cart page after
    back to shop page

Checkout product
    Checks the elements in the cart page before
    element should be enabled    ${checkoutButton}
    click button    ${checkoutButton}

Purchase a product
    [Arguments]    ${countryName}
    input text    ${inputCountry}   ${countryName}
    sleep    6
    click element    ${suggestCountry}
    wait until element is visible    ${acceptPurchaseTerms}
    click element    ${acceptPurchaseTerms}
    element should be enabled   ${purchaseButton}
    click button    ${purchaseButton}
    wait until page contains element    ${successPurchaseMessage}
    element should contain    ${successPurchaseMessage}     ${successTextMessage}   ignore_case=True





