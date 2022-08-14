*** Settings ***
Documentation                                           Variables and keywords for adding and delecting items in wishlist
Library                                                 SeleniumLibrary
Library                                                 RequestsLibrary
Library                                                 JSONLibrary
Library                                                 Collections
Library                                                 FakerLibrary
Resource                                                ../PageObject/wishList.robot
Resource                                                ../PageObject/generic.robot




*** Variables ***
${URL}                                                                      https://demo.nopcommerce.com/
${BROWSER}                                                                  chrome
${HOMEPAGE_LOGIN}                                                           xpath:/html/body/div[6]/div[1]/div[1]/div[2]/div[1]/ul/li[2]/a
${HOMEPAGE_LOGIN_EMAILFIELD}                                                xpath://*[@id="Email"]
${HOMEPAGE_LOGIN_PASSWORDFIELD}                                             xpath://*[@id="Password"]
${HOMEPAGE_LOGIN_BUTTON}                                                    xpath:/html/body/div[6]/div[3]/div/div/div/div[2]/div[1]/div[2]/form/div[3]/button
${ELEMENT_COMPUTER_BUTTON}                                                  xpath:/html/body/div[6]/div[2]/ul[1]/li[1]/a
${COMPUTER_DESKTOPS_BUTTON}                                                 xpath:/html/body/div[6]/div[3]/div/div[2]/div[1]/div[2]/ul/li[1]/ul/li[1]/a
${PRODUCT_TEXT_LINK}                                                        xpath:/html/body/div[6]/div[3]/div/div[3]/div/div[2]/div[2]/div[2]/div/div/div[1]/div/div[2]/h2/a
${COMPUTER_PROCESSOR_FIELD}                                                 id:product_attribute_1
${COMPUTER_RAM_FIELD}                                                       id:product_attribute_2
${COMPUTER_HDD_BUTTON}                                                      id:product_attribute_3_7
${COMPUTER_OS_BUTTON}                                                       id:product_attribute_4_9
${COMPUTER_SOFTWARE_BUTTON}                                                 id:product_attribute_5_11
${ADD_TO_WISHLIST_BUTTON}                                                   id:add-to-wishlist-button-1
${ADDED_TO_WISHLIST_SUCCESS MESSAGE}                                        xpath://*[@id="bar-notification"]/div/p
${CLOSE_SUCCESS_MESSAGE}                                                    xpath://*[@id="bar-notification"]/div/span
${WISHLIST_BUTTON}                                                          xpath:/html/body/div[6]/div[1]/div[1]/div[2]/div[1]/ul/li[3]/a/span[1]
${DELETE_ITEM_IN_WISHLIST}                                                  name:updatecart
${DELETE_ITEM_SUCCESS_MESSAGE}                                              xpath:/html/body/div[6]/div[3]/div/div/div/div[2]/div
*** Keywords ***
Click on login button
                    Click Element                              ${HOMEPAGE_LOGIN}
                    Wait and input text                        ${HOMEPAGE_LOGIN_EMAILFIELD}             dudu99@gmail.com
                    Wait and input text                        ${HOMEPAGE_LOGIN_PASSWORDFIELD}          testing
                    Wait and click element                     ${HOMEPAGE_LOGIN_BUTTON}
Add item or product to wishlist
                    wait and click element                     ${ELEMENT_COMPUTER_BUTTON}
                    wait and click element                     ${COMPUTER_DESKTOPS_BUTTON}
                    wait and click element                     ${PRODUCT_TEXT_LINK}
                    wait until element is visible              ${COMPUTER_PROCESSOR_FIELD}
                    select from list by index                  ${COMPUTER_PROCESSOR_FIELD}           2
                    wait until element is visible              ${COMPUTER_RAM_FIELD}
                    select from list by index                  ${COMPUTER_RAM_FIELD}                 3
                    wait and click element                     ${COMPUTER_HDD_BUTTON}
                    wait and click element                     ${COMPUTER_OS_BUTTON}
                    wait until element is visible              ${COMPUTER_SOFTWARE_BUTTON}
                    select checkbox                            ${COMPUTER_SOFTWARE_BUTTON}
                    wait and click element                     ${ADD_TO_WISHLIST_BUTTON}

Assert item is added to wishlist
                    wait until element is visible              ${ADDED_TO_WISHLIST_SUCCESS MESSAGE}
                    page should contain                        The product has been added to your wishlist
                    wait until element is visible              ${CLOSE_SUCCESS_MESSAGE}
                    click element                              ${CLOSE_SUCCESS_MESSAGE}

Delete item from the wishlist
                    wait and click element                     ${WISHLIST_BUTTON}
                    wait and click element                     ${DELETE_ITEM_IN_WISHLIST}
                    wait until element is visible              ${DELETE_ITEM_SUCCESS_MESSAGE}
                    page should contain                        The wishlist is empty!


