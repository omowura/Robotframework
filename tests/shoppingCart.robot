*** Settings ***
Documentation                                                   test suite for shopping cart in nopCommerce
Library                                                         SeleniumLibrary
Resource                                                        ../PageObject/shoppingCart.robot
Resource                                                        ../PageObject/generic.robot
Library                                                         FakerLibrary


*** Test Cases ***
User should be able to add items to shopping cart
           [Tags]      SMOKE      REGRESSION
           Navigate to homepage          chrome
           Adding camera and photo to shopping cart
           Adding cell phones to shopping cart
           View items in shopping cart
           Checkout as a guest

User billing information
           [Tags]       SMOKE
           Enter customer billing address firstname
           Enter customer billing address lastname
           Enter customer billing address email
           Select customer billing address country and enter city
           Enter customer billing address and postal code           65 Thompson Boulevard
           Enter customer billing phone number and click on continue button

User shipping and payment method
           [Tags]       SMOKE
           Enter customer shipping method
           Enter customer payment method
           Enter credit details and confirm payment
           [Teardown]     Assert order has been successfully placed and close all browsers




*** Keywords ***
Provided precondition
