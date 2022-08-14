*** Settings ***
Documentation                                           API testing using restcountries endpoint
Library                                                 SeleniumLibrary
Library                                                 RequestsLibrary
Library                                                 JSONLibrary
Library                                                 Collections



*** Variables ***
${base_url}                                             https://restcountries.com
${relative_url}                                         /v3.1/name
${New_relative_url}                                     /v3.1/alpha




*** Test Cases ***
Search by countries name
            Availability of Finland at the endpoint by name
            Availability of Sweden at the endpoint by name
            Availability of Estonia at the endpoint by name
Search country by code
            Availability of Finland at the endpoint by coountry code




*** Keywords ***
Availability of Finland at the endpoint by name
        Create Session    Tester               ${base_url}     verify=true
        ${response}=    GET On Session       Tester        ${relative_url}/Finland
        Status Should Be    200    ${response}
        Log To Console      ${response.json()}

Availability of Sweden at the endpoint by name
        Create Session    Tester               ${base_url}     verify=true
        ${response}=    GET On Session       Tester        ${relative_url}/Sweden
        Status Should Be    200    ${response}
        Log To Console      ${response.json()}

Availability of Estonia at the endpoint by name
        Create Session    Tester               ${base_url}     verify=true
        ${response}=    GET On Session       Tester        ${relative_url}/Estonia
        Status Should Be    200    ${response}
        Log To Console      ${response.json()}

Availability of Finland at the endpoint by coountry code
        Create Session    Tester             ${base_url}
        ${response}=    GET On Session       Tester     /v3.1/alpha     params=codes=fi,se,ee
        Status Should Be    200    ${response}
        Log To Console      ${response.json()}

        log         ${response.json()}[0][name]
        log         ${response.json()}[1][name]
        log         ${response.json()}[2][name]


