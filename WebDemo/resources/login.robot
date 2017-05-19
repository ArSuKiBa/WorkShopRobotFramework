*** Settings ***
Library    Selenium2Library

*** Variables ***
${LOGINURL}   http://localhost:7272
${BROWSER}    gc

*** Keywords ***
Go back to Login Page
    Go To    ${LOGINURL}

Login Success workflow
    [Arguments]    ${username}    ${password}
    Fill in username and password    ${username}    ${password}
    Click Login button
    Found Welcome Page
    #Go To    ${LOGINURL}

Login Fail workflow
    [Arguments]    ${username}    ${password}
    Fill in username and password    ${username}    ${password}
    Click Login button
    Found Error Page

Fill in Username and Password
    [Arguments]    ${username}    ${password}
    Input Text    id=username_field     ${username}
    Input Text    id=password_field     ${password}

Found Error Page
    Wait Until Element Contains    xpath=//*[@id="container"]/h1    Error Page

Found Welcome Page
    Wait Until Element Contains    xpath=//*[@id="container"]/h1    Welcome Page
    Page Should Contain Link    xpath=//*[@id="container"]/p/a    logout
    Click Element    xpath=//*[@id="container"]/p/a
    Wait Until Element Contains    xpath=//*[@id="container"]/h1    Login Page

Click Login button
    Click Button    LOGIN

Open browser to open Login Page
    Open Browser    ${LOGINURL}    browser=${BROWSER}

