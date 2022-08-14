*** Settings ***
Documentation                                           Variables and keywords for adding items to shopping cart
Library                                                 SeleniumLibrary
Library                                                 FakerLibrary
Resource                                                ../PageObject/shoppingCart.robot
Resource                                                ../PageObject/generic.robot



*** Variables ***
${URL}                                                                      https://demo.nopcommerce.com/
${BROWSER}                                                                  chrome
${ELECTRONICS_ELEMENT_BUTTON}                                               xpath:/html/body/div[6]/div[2]/ul[1]/li[2]/a
${CAMERA & PHOTO}                                                           xpath:/html/body/div[6]/div[2]/ul[1]/li[2]/ul/li[1]/a
${NIKON_D500_DSLR}                                                          xpath:/html/body/div[6]/div[3]/div/div[3]/div/div[2]/div[2]/div[2]/div/div/div[1]/div/div[2]/div[3]/div[2]/button[1]
${ADD_TO_CART_NIKON_D500}                                                   xpath://*[@id="add-to-cart-button-14"]
${CELL_PHONES}                                                              xpath:/html/body/div[6]/div[2]/ul[1]/li[2]/ul/li[2]/a
${HTC_ONE_M8_ANDROID}                                                       xpath:/html/body/div[6]/div[3]/div/div[3]/div/div[2]/div[2]/div[2]/div/div/div[1]/div/div[2]/div[3]/div[2]/button[1]
${SHOPPING_CART}                                                            xpath://*[@id="topcartlink"]/a/span[1]
${SHOPPING_GO_TO_CART}                                                      xpath://*[text() ='Go to cart']
${GIFT_RAPPING}                                                             id:checkout_attribute_1
${TERM_OF_SERVICE_BUTTON}                                                   id:termsofservice
${CHECKOUT_BUTTON}                                                          id:checkout
${CHECKOUT_AS_GUEST_BUTTON}                                                 xpath:/html/body/div[6]/div[3]/div/div/div/div[2]/div[1]/div[1]/div[3]/button[1]
${SHIP_TO_SAME_ADDRESS}                                                     id:ShipToSameAddress
${CONTINUE_BUTTON}                                                          name:save
${CLOSE_SUCCESS_MESSAGE}                                                    xpath://*[@id="bar-notification"]/div/span

#Adding order billing details
${BILLING_ADDRESS_FIRSTNAME}                                                id:BillingNewAddress_FirstName
${BILLING_ADDRESS_LASTNAME}                                                 id:BillingNewAddress_LastName
${BILLING_ADDRESS_EMAIL}                                                    id:BillingNewAddress_Email
${BILLING_ADDRESS_COUNTRY}                                                  id:BillingNewAddress_CountryId
${BILLING_ADDRESS_CITY}                                                     id:BillingNewAddress_City
${BILLING_ADDRESS_ADDRESS}                                                  id:BillingNewAddress_Address1
${BILLING_ADDRESS_POSTALCODE}                                               id:BillingNewAddress_ZipPostalCode
${BILLING_ADDRESS_PHONENUMBER}                                              id:BillingNewAddress_PhoneNumber
${BILLING_ADDRESS_CONTINUE_BUTTON}                                          xpath://*[@id="billing-buttons-container"]/button[4]
${BILLING_ADDRESS_CONTINUE_BUTTON2}                                         xpath://*[@id="shipping-buttons-container"]/button
${SHIPPING_METHOD_BUTTON}                                                   xpath://*[text() ="Next Day Air ($0.00)"]
${SHIPPING_METHOD_CONTINUE_BUTTON}                                          xpath://*[@id="shipping-method-buttons-container"]/button
#Adding order payment method
${PAYMENT_METHOD_BUTTON}                                                    xpath://*[text() ="Credit Card"]
${PAYMENT_METHOD_CONTINUE}                                                  xpath://*[@id="payment-method-buttons-container"]/button
${CREDIT_CARD_TYPE}                                                         xpath://*[@id="CreditCardType"]
${CREDIT_CARD_HOLDER_NAME}                                                  xpath://*[@id="CardholderName"]
${CREDIT_CARD_NUMBER}                                                       xpath://*[@id="CardNumber"]
${CREDIT_CARD_EMONTH}                                                       xpath://*[@id="ExpireMonth"]
${CREDIT_CARD_EYEAR}                                                        xpath://*[@id="ExpireYear"]
${CREDIT_CARD_CODE}                                                         xpath://*[@id="CardCode"]
${PAYMENT_METHOD_CONTINUE2}                                                 xpath://*[@id="payment-info-buttons-container"]/button
${PAYMENT_CONFIRMATION_BUTTON}                                              xpath://*[@id="confirm-order-buttons-container"]/button
${ORDER_SUCCESS_MESSAGE}                                                    xpath:/html/body/div[6]/div[3]/div/div/div/div[2]/div/div[1]/strong
${RETURN_CUSTOMER_LOGIN_BUTTON}                                             xpath:/html/body/div[6]/div[3]/div/div/div/div[2]/div[1]/div[2]/form/div[4]/button
${HOMEPAGE_LOGIN}                                                           xpath:/html/body/div[6]/div[1]/div[1]/div[2]/div[1]/ul/li[2]/a
${HOMEPAGE_LOGIN_EMAILFIELD}                                                xpath://*[@id="Email"]
${HOMEPAGE_LOGIN_PASSWORDFIELD}                                             xpath://*[@id="Password"]
${HOMEPAGE_LOGIN_BUTTON}                                                    xpath:/html/body/div[6]/div[3]/div/div/div/div[2]/div[1]/div[2]/form/div[3]/button



*** Keywords ***
Navigate to homepage
                    [Arguments]         ${browser_name}
                    Open Browser                               ${URL}       ${browser_name}
                    Maximize Browser Window
                    Click Element                              ${HOMEPAGE_LOGIN}

Adding camera and photo to shopping cart
                    wait until element is visible              ${ELECTRONICS_ELEMENT_BUTTON}
                    mouse over                                 ${ELECTRONICS_ELEMENT_BUTTON}
                    click element                              ${CAMERA & PHOTO}
                    wait and click element                     ${NIKON_D500_DSLR}
                    wait and click element                     ${ADD_TO_CART_NIKON_D500}
                    wait and click element                     ${CLOSE_SUCCESS_MESSAGE}

Adding cell phones to shopping cart
                    wait until element is visible              ${ELECTRONICS_ELEMENT_BUTTON}
                    mouse over                                 ${ELECTRONICS_ELEMENT_BUTTON}
                    wait and click element                     ${CELL_PHONES}
                    wait and click element                     ${HTC_ONE_M8_ANDROID}
                    wait and click element                     ${CLOSE_SUCCESS_MESSAGE}

View items in shopping cart
                    wait until element is visible              ${SHOPPING_CART}
                    mouse over                                 ${SHOPPING_CART}
                    Wait Until Element Is Visible              ${SHOPPING_GO_TO_CART}
                    click element                              ${SHOPPING_GO_TO_CART}
                    wait until element is visible              ${GIFT_RAPPING}
                    select from list by index                  ${GIFT_RAPPING}                 1
                    wait and click element                     ${TERM_OF_SERVICE_BUTTON}

Checkout as a guest
                    wait and click element                     ${CHECKOUT_BUTTON}
                    wait and click element                     ${CHECKOUT_AS_GUEST_BUTTON}
                    wait until element is visible              ${SHIP_TO_SAME_ADDRESS}
                    unselect checkbox                          ${SHIP_TO_SAME_ADDRESS}

Enter customer billing address firstname
                    ${firstname}=      FakerLibrary.firstname
                    log   ${firstname}
                    Set Test variable    ${firstname}
                    wait and Input Text                       ${BILLING_ADDRESS_FIRSTNAME}               ${firstname}

Enter customer billing address lastname
                    ${lastname}=      FakerLibrary.lastname
                    log   ${lastname}
                    Set Test variable    ${lastname}
                    wait and Input Text                       ${BILLING_ADDRESS_LASTNAME}               ${lastname}

Enter customer billing address email
                    ${email}=      FakerLibrary.email
                    log   ${email}
                    Set Test variable    ${email}
                    wait and Input Text                       ${BILLING_ADDRESS_EMAIL}                 ${email}
Select customer billing address country and enter city
                    wait until element is visible             ${BILLING_ADDRESS_COUNTRY}
                    select from list by label                 ${BILLING_ADDRESS_COUNTRY}                 Finland
                    wait and input text                       ${BILLING_ADDRESS_CITY}                   Helsinki

Enter customer billing address and postal code
                    [Arguments]    ${address1_address}
                    wait and input text                       ${BILLING_ADDRESS_ADDRESS}               ${address1_address}
                    wait and input text                       ${BILLING_ADDRESS_POSTALCODE}            00000

Enter customer billing phone number and click on continue button
                    wait and input text                       ${BILLING_ADDRESS_PHONENUMBER}           +35846000055
                    Wait Until Element Is Visible             ${BILLING_ADDRESS_CONTINUE_BUTTON}
                    click element                             ${BILLING_ADDRESS_CONTINUE_BUTTON}
                    Wait Until Element Is Visible             ${BILLING_ADDRESS_CONTINUE_BUTTON2}
                    click element                             ${BILLING_ADDRESS_CONTINUE_BUTTON2}

Enter customer shipping method
                    wait and click element                    ${SHIPPING_METHOD_BUTTON}
                    wait and click element                    ${SHIPPING_METHOD_CONTINUE_BUTTON}

Enter customer payment method
                    wait and click element                    ${PAYMENT_METHOD_BUTTON}
                    wait and click element                    ${PAYMENT_METHOD_CONTINUE}

Enter credit details and confirm payment
                    wait until element is visible             ${CREDIT_CARD_TYPE}
                    select from list by index                 ${CREDIT_CARD_TYPE}                   1
                    wait and input text                       ${CREDIT_CARD_HOLDER_NAME}            Jones Jay
                    wait and input text                       ${CREDIT_CARD_NUMBER}                 5356870000367131
                    wait until element is visible             ${CREDIT_CARD_EMONTH}
                    select from list by index                 ${CREDIT_CARD_EMONTH}                 5
                    wait until element is visible             ${CREDIT_CARD_EYEAR}
                    select from list by value                 ${CREDIT_CARD_EYEAR}                  2026
                    wait and input text                       ${CREDIT_CARD_CODE}                   033
                    wait and click element                    ${PAYMENT_METHOD_CONTINUE2}
                    Wait Until Element Is Visible             ${PAYMENT_CONFIRMATION_BUTTON}
                    click element                             ${PAYMENT_CONFIRMATION_BUTTON}

Assert order has been successfully placed and close all browsers
                    Wait and click element                    ${ORDER_SUCCESS_MESSAGE}
                    page should contain                       Your order has been successfully processed!
                    close browser

