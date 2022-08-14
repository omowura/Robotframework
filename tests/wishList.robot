*** Settings ***
Documentation                                                   test suite for adding items to wishlist
Library                                                         SeleniumLibrary
Resource                                                        ../PageObject/wishList.robot
Suite Setup                                                     Open browser with the url
Resource                                                        ../PageObject/generic.robot


*** Test Cases ***
User should be able to add and delete item from wishlist
                    [Tags]       REGRESSION
                    Click on login button
                    Add item or product to wishlist
                    Assert item is added to wishlist
                    Delete item from the wishlist
                    [Teardown]      Close Browser







*** Keywords ***
Provided precondition
