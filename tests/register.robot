*** Settings ***
Documentation                                                   test suite for registration nopCommerce
Library                                                         SeleniumLibrary
Library                                                         FakerLibrary
Resource                                                        ../PageObject/register.robot
Suite Setup                                                     Open browser with the url
Resource                                                        ../PageObject/generic.robot
Suite Teardown                                                  close all browsers


*** Test Cases ***
User should be able to register account
             [Tags]        SMOKE      REGRESSION
             On the homepage click on register button
             Select user gender
             Enter new user firstname
             Enter new user lastname
             Select new user birth in day, month and year
             Enter new user email
             Enter new user password, confirm password and click register button

User should be able to add address
             [Tags]        SMOKE
             Enter customer address
             Enter customer address firstname
             Enter customer address lastname
             Enter customer address email
             Select customer address country and enter city
             Enter customer address and postal code              50 Golden Street
             Enter customer phone number and click on save button














*** Keywords ***
Provided precondition
