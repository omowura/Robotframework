*** Settings ***
Documentation                                               test suite for adding laptops to cart
Library                                                     SeleniumLibrary
Resource                                                    ../PageObject/shoppingCartExtra.robot
Resource                                                    ../PageObject/generic.robot
Suite Setup                                                 Open browser with the url
Suite Teardown                                              Close All Browsers




*** Test Cases ***
Homepage login
           Navigate to nopCommerce homepage
Validate laptop titles
           Verify laptop titles in the shopping page
Adding items to shoppingCart extra
           Go to homepage and click on login button
           Select laptop1    HP Envy 6-1180ca 15.6-Inch Sleekbook
           Select laptop2    Lenovo Thinkpad X1 Carbon Laptop
           Select laptop3    Asus N551JK-XO076H Laptop
           Select laptop4    Samsung Series 9 NP900X4C Premium Ultrabook












