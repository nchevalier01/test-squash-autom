*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://www.amazon.fr
${BROWSER}        Firefox

*** Test Cases ***
Valid Login
    Open Browser To Home page
    Click To Login Page
    Input Username    nschevalier@club-internet.fr
    Click Continue
    Input Password    Beynost@2018
    Click Submit
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${LOGIN URL}    ${BROWSER}

Click To Login Page
    Wait Until Element Is Visible    nav-link-accountList-nav-line-1
    Click Element    nav-link-accountList-nav-line-1

Input Username
    [Arguments]    ${username}
    Input Text    email    ${username}

Click Continue
    Click Button    continue

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Click Submit
    Click Button    signInSubmit    
    
