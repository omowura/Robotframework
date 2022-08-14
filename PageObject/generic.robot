*** Settings ***
Documentation                                                   A resource file with reusable keywords and variables
Library                                                         SeleniumLibrary




*** Variables ***
${login_email}                                              dudu99@gmail.com
${login_password}                                           testing
${url}                                                      https://demo.nopcommerce.com/
${browser_name}                                             Chrome
${HOMEPAGE_LOGIN}                                           xpath:/html/body/div[6]/div[1]/div[1]/div[2]/div[1]/ul/li[2]/a
${HOMEPAGE_LOGIN_EMAILFIELD}                                xpath://*[@id="Email"]
${HOMEPAGE_LOGIN_PASSWORDFIELD}                             xpath://*[@id="Password"]
${HOMEPAGE_LOGIN_BUTTON}                                    xpath:/html/body/div[6]/div[3]/div/div/div/div[2]/div[1]/div[2]/form/div[3]/button



*** Keywords ***
Open browser with the url
        Open Browser                ${url}              ${browser_name}
        Maximize Browser Window

Enter valid credential and login
        Wait and click element               ${HOMEPAGE_LOGIN}
        Wait and input text                  ${HOMEPAGE_LOGIN_EMAILFIELD}            ${login_email}
        Wait and input text                  ${HOMEPAGE_LOGIN_PASSWORDFIELD}         ${login_password}
        Wait and click element               ${HOMEPAGE_LOGIN_BUTTON}


Wait and input text
        [Arguments]         ${page_locator}     ${text}
        Wait Until Element Is Visible               ${page_locator}        timeout=10
        Input Text                                  ${page_locator}      ${text}

Wait and click element
        [Arguments]     ${page_locator}              ${timeout}=10s
        Wait Until Element Is Visible       ${page_locator}
        Click Element       ${page_locator}




