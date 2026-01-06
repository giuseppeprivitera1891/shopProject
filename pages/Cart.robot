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
    Element Text Should Be    ${productStatus}      ${productTextStatus}    ignore_case=True
    Page Should Contain Element    ${totalPrice}
    Element Text Should Be    ${removeButton}     ${removeTextButton}     ignore_case=True
    Element Text Should Be     ${backShopPage}   ${backShopPageTextButton}   ignore_case=True

Checks the elements in the cart page after
    Page Should Not Contain Element    ${productStatus}
    Page Should Not Contain Button    ${removeButton}

Back to shop page
    Element Should Be Enabled    ${backShopPage}
    Click Button    ${backShopPage}

Remove a product
    Checks The Elements In The Cart Page Before
    Element Should Be Enabled    ${removeButton}
    Click Button    ${removeButton}
    Checks The Elements In The Cart Page After
    Back To Shop Page

Checkout product
    Checks The Elements In The Cart Page Before
    Element Should Be Enabled    ${checkoutButton}
    Click Button    ${checkoutButton}

Purchase a product
    [Arguments]    ${countryName}
    Input Text    ${inputCountry}   ${countryName}
    Sleep    6
    Click Element    ${suggestCountry}
    Wait Until Element Is Visible    ${acceptPurchaseTerms}
    Click Element    ${acceptPurchaseTerms}
    Element Should Be Enabled    ${purchaseButton}
    Click Button    ${purchaseButton}
    Wait Until Page Contains Element    ${successPurchaseMessage}
    Element Should Contain    ${successPurchaseMessage}     ${successTextMessage}   ignore_case=True





