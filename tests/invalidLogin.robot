*** Settings ***
Documentation                                                           test suite for invalid login
Library                                                                 SeleniumLibrary
Resource                                                                ../PageObject/invalidLogin.robot
Resource                                                                ../PageObject/generic.robot
Suite Setup                                                             Open browser with the url



*** Test Cases ***
Invalid login
                    [Template]   Login with invalid login credentials should return correct message
                    #email                                            password                            errormessage
                    iwalewa22@gmail.com                              testing                             No customer account found
                    iwalewa+22g@mail.com                             test                                No customer account found
                    ${EMPTY}                                         testing                             Please enter your email
                    iwalewa+22@gmail.com                             ${EMPTY}                            No customer account found
                    ${EMPTY}                                         ${EMPTY}                            Please enter your email
                    [Teardown]    close all browsers

*** Keywords ***




