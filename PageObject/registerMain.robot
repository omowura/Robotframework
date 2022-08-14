*** Settings ***
Documentation                                       Variables and keywords second registration main
Library                                             SeleniumLibrary
Library                                             FakerLibrary
Resource                                            ../PageObject/generic.robot


*** Variables ***
${REGISTER_BUTTON}                                                          xpath:/html/body/div[6]/div[1]/div[1]/div[2]/div[1]/ul/li[1]/a
${REGISTER_GENDER_BUTTON}                                                   id:gender-female
${REGISTER_FIRSTNAME}                                                       id:FirstName
${REGISTER_LASTNAME}                                                        id:LastName
${REGISTER_DOB_DAY}                                                         name:DateOfBirthDay
${REGISTER_DOB_MONTH}                                                       name:DateOfBirthMonth
${REGISTER_DOB_YEAR}                                                        name:DateOfBirthYear
${REGISTER_EMAILFIELD}                                                      id:Email
${REGISTER_PASSWORDFIELD}                                                   xpath://*[@id="Password"]
${REGISTER_CONFIRM_PASSWORDFIELD}                                           xpath://*[@id="ConfirmPassword"]
${REGISTER_REGISTER_BUTTON}                                                 id:register-button
${REGISTER_CONTINUE_BUTTON}                                                 class:button-1 register-continue-button


*** Keywords ***
On the homepage click on register button
                    Wait and click element                     ${REGISTER_BUTTON}

Select user gender main
                    Wait and click element                     ${REGISTER_GENDER_BUTTON}

Enter new user firstname main
                    Wait and input text                        ${REGISTER_FIRSTNAME}               Jones

Enter new user lastname main
                    Wait and input text                        ${REGISTER_LASTNAME}                 Uche

Select new user birth in day, month and year main
                    wait until element is visible              ${REGISTER_DOB_DAY}
                    select from list by value                  ${REGISTER_DOB_DAY}                 11
                    wait until element is visible              ${REGISTER_DOB_MONTH}
                    select from list by index                  ${REGISTER_DOB_MONTH}               5
                    wait until element is visible              ${REGISTER_DOB_YEAR}
                    select from list by value                  ${REGISTER_DOB_YEAR}                1989

Enter new user email main
                    ${email}=      FakerLibrary.email
                    log   ${email}
                    Set Test variable    ${email}
                    wait and Input Text                        ${REGISTER_EMAILFIELD}               ${email}
                    #Wait and input text                        ${REGISTER_EMAILFIELD}               dudu99@gmail.com

Enter new user password, confirm password and click register button main
                    Wait and input text                        ${REGISTER_PASSWORDFIELD}            testing
                    Wait and input text                        ${REGISTER_CONFIRM_PASSWORDFIELD}    testing
                    Wait and click element                     ${REGISTER_REGISTER_BUTTON}

Assert that page contains logout and close all browsers main
                    wait until page contains                   Your registration completed
                    Page should contain                        Your registration completed

