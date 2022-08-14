*** Settings ***
Documentation                                           variables and keywods for new user registration
Library                                                 SeleniumLibrary
Library                                                 FakerLibrary
Resource                                                ../PageObject/register.robot
Resource                                                ../PageObject/generic.robot


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
${MY_ACCOUNT_BUTTON}                                                        xpath:/html/body/div[6]/div[1]/div[1]/div[2]/div[1]/ul/li[1]/a
${ADDRESS_BUTTON}                                                           xpath:/html/body/div[6]/div[3]/div/div[1]/div/div[2]/ul/li[2]/a
${ADDRESS_ADDNEW_BUTTON}                                                    xpath:/html/body/div[6]/div[3]/div/div[2]/div/div[2]/div[2]/button
${ADDRESS_FIRSTNAME}                                                        id:Address_FirstName
${ADDRESS_LASTNAME}                                                         id:Address_LastName
${ADDRESS_EMAIL}                                                            id:Address_Email
${ADDRESS_COUNTRY}                                                          id:Address_CountryId
${ADDRESS_CITY}                                                             id:Address_City
${ADDRESS_ADDRESS}                                                          id:Address_Address1
${ADDRESS_POSTAL_CODE}                                                      id:Address_ZipPostalCode
${ADDRESS_PHONE_NUMBER}                                                     id:Address_PhoneNumber
${ADDRESS_SAVE_BUTTON}                                                      xpath:/html/body/div[6]/div[3]/div/div[2]/form/div/div[2]/div[2]/button


*** Keywords ***
On the homepage click on register button
                      wait and Click element                    ${REGISTER_BUTTON}

Select user gender
                      wait and click element                    ${REGISTER_GENDER_BUTTON}

Enter new user firstname
                     ${firstname}=      FakerLibrary.firstname
                     log   ${firstname}
                     Set Test variable    ${firstname}
                     wait and Input Text                        ${REGISTER_FIRSTNAME}              ${firstname}

Enter new user lastname
                     ${lastname}=      FakerLibrary.lastname
                     log   ${lastname}
                     Set Test variable    ${lastname}
                     wait and Input Text                       ${REGISTER_LASTNAME}                ${lastname}

Select new user birth in day, month and year
                    wait until element is visible              ${REGISTER_DOB_DAY}
                    select from list by value                  ${REGISTER_DOB_DAY}                 11
                    wait until element is visible              ${REGISTER_DOB_MONTH}
                    select from list by index                  ${REGISTER_DOB_MONTH}               5
                    wait until element is visible              ${REGISTER_DOB_YEAR}
                    select from list by value                  ${REGISTER_DOB_YEAR}                1989

Enter new user email
                    ${email}=      FakerLibrary.email
                    log   ${email}
                    Set Test variable    ${email}
                    wait and Input Text                        ${REGISTER_EMAILFIELD}               ${email}

Enter new user password, confirm password and click register button
                    wait and Input Text                        ${REGISTER_PASSWORDFIELD}            testing
                    wait and Input Text                        ${REGISTER_CONFIRM_PASSWORDFIELD}    testing
                    wait and Click element                     ${REGISTER_REGISTER_BUTTON}

Assert that page contains logout and close all browsers
                    wait until page contains                  Your registration completed
                    Page should contain                       Your registration completed
                    Sleep  5
                    wait and click element                    ${REGISTER_CONTINUE_BUTTON}

Enter customer address
                    wait and click element                    ${MY_ACCOUNT_BUTTON}
                    wait and click element                    ${ADDRESS_BUTTON}
                    wait and click element                    ${ADDRESS_ADDNEW_BUTTON}

Enter customer address firstname
                    ${firstname}=      FakerLibrary.firstname
                    log   ${firstname}
                    Set Test variable    ${firstname}
                    wait and Input Text                        ${ADDRESS_FIRSTNAME}              ${firstname}

Enter customer address lastname
                    ${lastname}=      FakerLibrary.lastname
                    log   ${lastname}
                    Set Test variable    ${lastname}
                    wait and Input Text                        ${ADDRESS_LASTNAME}              ${lastname}

Enter customer address email
                    ${email}=      FakerLibrary.email
                    log   ${email}
                    Set Test variable    ${email}
                    wait and Input Text                        ${ADDRESS_EMAIL}                 ${email}

Select customer address country and enter city
                    wait until element is visible              ${ADDRESS_COUNTRY}
                    select from list by label                  ${ADDRESS_COUNTRY}               Finland
                    wait and input text                        ${ADDRESS_CITY}                  Helsinki

Enter customer address and postal code
                    [Arguments]    ${address1_address}
                    wait and input text                        ${ADDRESS_ADDRESS}               ${address1_address}
                    wait and input text                        ${ADDRESS_POSTAL_CODE}           00000

Enter customer phone number and click on save button
                    wait and input text                        ${ADDRESS_PHONE_NUMBER}          +35846000055
                    wait and click element                     ${ADDRESS_SAVE_BUTTON}



