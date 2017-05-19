*** Settings ***
Library    Selenium2Library
Test Teardown    Close Browser


*** Variables ***
${LOGINURL}   http://localhost:7272
${BROWSER}    gc

*** Test Cases ***
Wrong Username
    Open browser to open Login Page
    Fill in Username and Password    username    mode
    Click Login button
    Found Error Page

Wrong Password
    Open browser to open Login Page
    Fill in Username and Password    demo    password
    Click Login button
    Found Error Page

Wrong Username and Password
    Open browser to open Login Page
    Fill in Username and Password    username    password
    Click Login button
    Found Error Page

Missing Username
    Open browser to open Login Page
    Fill in Username and Password    ${EMPTY}    mode
    Click Login button
    Found Error Page

Missing Password
    Open browser to open Login Page
    Fill in Username and Password    demo    ${EMPTY}
    Click Login button
    Found Error Page

Missing Username and Password
    Open browser to open Login Page
    Fill in Username and Password    ${EMPTY}    ${EMPTY}
    Click Login button
    Found Error Page

*** Keywords ***
Open browser to open Login Page
    Open Browser    ${LOGINURL}    browser=${BROWSER}

Fill in Username and Password
    [Arguments]    ${username}    ${password}
    Input Text    id=username_field     ${username}
    Input Text    id=password_field     ${password}

Click Login button
    Click Button    LOGIN
    #Submit Form

Found Error Page
    Wait Until Element Contains    xpath=//*[@id="container"]/h1    Error Page