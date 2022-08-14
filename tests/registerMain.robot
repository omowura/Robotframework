*** Settings ***
Documentation                                                   test suite for register nopCommerce
Library                                                         SeleniumLibrary
Resource                                                        ../PageObject/registerMain.robot
Resource                                                        ../PageObject/generic.robot
Suite Setup                                                     Open browser with the url
Library                                                         FakerLibrary



*** Test Cases ***
User should be able to create main account
                  [Tags]       REGRESSION
                  On the homepage click on register button
                  Select user gender main
                  Enter new user firstname main
                  Enter new user lastname main
                  Select new user birth in day, month and year main
                  Enter new user email main
                  Enter new user password, confirm password and click register button main
                  Assert that page contains logout and close all browsers main
                  [Teardown]  close all browsers

