*** Settings ***
Documentation                                           Variables and keywords for invalid login
Library                                                 SeleniumLibrary
Library                                                 Collections


*** Variables ***
${HOMEPAGE_LOGIN}                                                           xpath:/html/body/div[6]/div[1]/div[1]/div[2]/div[1]/ul/li[2]/a
${HOMEPAGE_LOGIN_EMAILFIELD}                                                xpath://*[@id="Email"]
${HOMEPAGE_LOGIN_PASSWORDFIELD}                                             xpath://*[@id="Password"]
${HOMEPAGE_LOGIN_BUTTON}                                                    xpath:/html/body/div[6]/div[3]/div/div/div/div[2]/div[1]/div[2]/form/div[3]/button





*** Keywords ***
Login with invalid login credentials should return correct message
                     [Arguments]          ${username}            ${password}        ${errormessage}
                     click element                  ${HOMEPAGE_LOGIN}
                     input text                     ${HOMEPAGE_LOGIN_EMAILFIELD}                   ${username}
                     input text                     ${HOMEPAGE_LOGIN_PASSWORDFIELD}                ${password}
                     click element                  ${HOMEPAGE_LOGIN_BUTTON}
                     page should contain            ${errormessage}
