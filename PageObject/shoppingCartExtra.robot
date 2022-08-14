*** Settings ***
Documentation                                           Variables and keywords for adding items to cart extra
Library                                                 SeleniumLibrary
Library                                                 Collections
Library                                                 FakerLibrary
Resource                                                ../PageObject/shoppingCartExtra.robot
Resource                                                ../PageObject/generic.robot




*** Variables ***
${ELEMENT_COMPUTER_BUTTON}                                                  xpath:/html/body/div[6]/div[2]/ul[1]/li[1]/a
${URL}                                                                      https://demo.nopcommerce.com/
${BROWSER}                                                                  chrome
${SHOPPING_PRODUCT_TITLES}                                                  css:.product-title
${COMPUTER_NOTEBOOKS_BUTTON}                                                xpath://body/div[6]/div[2]/ul[1]/li[1]/ul[1]/li[2]/a[1]
${HOMEPAGE_LOGIN}                                                           xpath:/html/body/div[6]/div[1]/div[1]/div[2]/div[1]/ul/li[2]/a
${HOMEPAGE_LOGIN_EMAILFIELD}                                                xpath://*[@id="Email"]
${HOMEPAGE_LOGIN_PASSWORDFIELD}                                             xpath://*[@id="Password"]
${HOMEPAGE_LOGIN_BUTTON}                                                    xpath:/html/body/div[6]/div[3]/div/div/div/div[2]/div[1]/div[2]/form/div[3]/button


*** Keywords ***
Navigate to nopCommerce homepage
                     #[Arguments]          ${browser_name}
                     #Open Browser                   ${URL}          ${browser_name}
                     #Maximize Browser Window
                     Open browser with the url
                     Wait Until Element Is Visible       ${ELEMENT_COMPUTER_BUTTON}
                     Mouse Over                          ${ELEMENT_COMPUTER_BUTTON}
                     Wait Until Element Is Visible       ${COMPUTER_NOTEBOOKS_BUTTON}
                     Click Element                       ${COMPUTER_NOTEBOOKS_BUTTON}

Go to homepage and click on login button
                    #[Arguments]          ${browser_name}
                    #Open Browser                               ${URL}       ${browser_name}
                    #Maximize Browser Window
                    Click Element                              ${HOMEPAGE_LOGIN}
                    Wait and input text                        ${HOMEPAGE_LOGIN_EMAILFIELD}             dudu99@gmail.com
                    Wait and input text                        ${HOMEPAGE_LOGIN_PASSWORDFIELD}          testing
                    Wait and click element                     ${HOMEPAGE_LOGIN_BUTTON}


Verify laptop titles in the shopping page
                     @{expectedList}=  Create List     Apple MacBook Pro 13-inch     Asus N551JK-XO076H Laptop   HP Envy 6-1180ca 15.6-Inch Sleekbook   HP Spectre XT Pro UltraBook   Lenovo Thinkpad X1 Carbon Laptop   Samsung Series 9 NP900X4C Premium Ultrabook
                     ${elements}=      Get WebElements                ${SHOPPING_PRODUCT_TITLES}
                     @{actualList}=    Create List

                     FOR   ${element}  IN    @{elements}
                           log     ${element.text}
                           Append To List          ${actualList}             ${element.text}

                     END
                     Lists Should Be Equal       ${expectedList}        ${actualList}

Select laptop1
                    [Arguments]        ${noteBook}
                    Open browser with the url
                    ${elements}=      Get WebElements                ${SHOPPING_PRODUCT_TITLES}
                    ${index}=         Set Variable      1
                    FOR   ${element}  IN    @{elements}
                        Exit For Loop If        '${noteBook}' == '${element.text}'
                        ${index}=    Evaluate   ${index} + 1
                    END
                    Click Element                             xpath:(//*[@class="buttons"])[${index}]

Select laptop2
                    [Arguments]        ${noteBook}
                    Open browser with the url
                    ${elements}=      Get WebElements                ${SHOPPING_PRODUCT_TITLES}
                    ${index}=         Set Variable      1
                    FOR   ${element}  IN    @{elements}
                        Exit For Loop If        '${noteBook}' == '${element.text}'
                        ${index}=    Evaluate   ${index} + 1
                    END
                    Click Element                           xpath:(//*[@class="buttons"])[${index}]

Select laptop3
                    [Arguments]        ${noteBook}
                    Open browser with the url
                    ${elements}=      Get WebElements                ${SHOPPING_PRODUCT_TITLES}
                    ${index}=         Set Variable      1
                    FOR   ${element}  IN    @{elements}
                        Exit For Loop If        '${noteBook}' == '${element.text}'
                        ${index}=    Evaluate   ${index} + 1
                    END
                    Click Element                                   xpath:(//*[@class="buttons"])[${index}]

Select laptop4
                    [Arguments]        ${noteBook}
                    Open browser with the url
                    ${elements}=      Get WebElements                ${SHOPPING_PRODUCT_TITLES}
                    ${index}=         Set Variable      1
                    FOR   ${element}  IN    @{elements}
                        Exit For Loop If        '${noteBook}' == '${element.text}'
                        ${index}=    Evaluate   ${index} + 1
                    END
                    Click Element                                   xpath:(//*[@class='buttons'])[${index}]






