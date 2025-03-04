*** Settings ***
Documentation     Test Authentification.
Library            SeleniumLibrary

*** Variables ***
${URL}            https://ecommerce-playground.lambdatest.io/index.php?route=account/login
${BROWSER}      Chrome
${LOGIN}        nchevalier@sc-services.fr
${PASSWORD}     123456
${MYACCOUNT}    My Account

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Send Login
    Send Password
    Click To Submit
    Check MyAccount
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}

Send Login
    Input Text    email    ${LOGIN}

Click To Continue
    Click Element    continue

Send Password
    Input Password    password    ${PASSWORD}

Click To Submit
    Click Element    css:#content > div > div:nth-child(2) > div > div > form > input

Check MyAccount
    Element Should Contain    account-account    ${MYACCOUNT}    ignore_case = True

