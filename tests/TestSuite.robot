*** Settings ***
Resource    ../pages/AddProduct.robot
Resource    ../pages/Cart.robot
Resource    ../pages/Login.robot
Suite Setup  Open the browser
Suite Teardown    Close the browser

*** Variables ***
${fileUserPath}    ../../PycharmProjects/shopProject/data/user.xls
${user}     user
${fileCountryPath}      ../../PycharmProjects/shopProject/data/country.xls
${country}      country
${addProduct}   Samsung Note 8
${addNewProduct}    iphone X
${countryName}  india

*** Test Cases ***
Test Case 01 - Login with correct credentials
    [Documentation]    Login with correct credentials
    [Tags]    login
    Start video    name=Test Case 01 - Login with correct credentials
    Open file      ${fileUserPath}     ${user}
    ${username} =   read excel cell    row_num=5    col_num=2
    ${password} =   read excel cell    row_num=5    col_num=3
    Enter correct credentials     ${username}     ${password}
    Close file
    Stop video

Test Case 02 - Add a product
    [Documentation]    Add a new product to the cart
    [Tags]    addProduct     correct
    Start video    name=Test Case 02 - Add a product
    Add a product  ${addProduct}
    Stop video

Test Case 03 - Remove a product from the cart
    [Documentation]    Remove a product from the cart
    [Tags]    removeProduct
    Start video    name=Test Case 03 - Remove a product from the cart
    Remove a product
    Stop video

Test Case 04 - Add a new product to the cart
    [Documentation]    Add a new product to the cart
    [Tags]    addNewProduct
    Start video    name=Test Case 04 - Add a new product to the cart
    Add a product  ${addNewProduct}
    Stop video

Test Case 05 - Purchase a product
    [Documentation]    Purchase a product
    [Tags]    purchase
    Start video    name=Test Case 05 - Purchase a product
    Checkout product
    Open file    ${fileCountryPath}    ${country}
    ${countryName} =    read excel cell    row_num=2    col_num=1
    Purchase a product     ${countryName}
    Close file
    Stop video
