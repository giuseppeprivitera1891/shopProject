# Login page
usernameInput = "id:username"
passwordInput = "id:password"
signInButton = "id:signInBtn"
wrongCredentials = "xpath://strong[normalize-space()='Incorrect']"
userRadioButton = "css:input[value='user']"
messageModalLogin = "xpath://p[contains(text(),'You will be limited to only fewer functionalities ')]"
okayButtonModal = "id:okayBtn"
acceptTerms = "name:terms"

# Shop page
listProducts = "css:.card-title"
addProductSamsung = "xpath:(//button[contains(text(),'Add')])[2]"
addProductIphone = "xpath:(//button[contains(text(),'Add')])[1]"
checkoutProductButton = "xpath://a[@class='nav-link btn btn-primary']"

# Cart page
productStatus = "xpath:(//strong[normalize-space()='In Stock'])[1]"
totalPrice = "css:td[class='text-right'] h3 strong"
removeButton = "xpath://button[normalize-space()='Remove']"
checkoutButton = "xpath://button[normalize-space()='Checkout']"
backShopPage = "css:button[class='btn btn-default']"
inputCountry = "id:country"
suggestCountry = "css:div[class='suggestions'] ul li a"
acceptPurchaseTerms = "css:label[for='checkbox2']"
purchaseButton = "css:input[value='Purchase']"
successPurchaseMessage = "css:.alert.alert-success.alert-dismissible"
