*** Settings ***
Library    Selenium2Library

*** Variables ***
${LOGINURL}   http://localhost:7272
${BROWSER}    gc

*** Test Cases ***
Login Success
    Open browser to open Login Page
    Fill in Username and Password
    Click Login button
    Found Welcome Page
    Check link for logout and be able to click
    Back to Login Page

*** Keywords ***
Open browser to open Login Page
    Open Browser    ${LOGINURL}    browser=${BROWSER}

Fill in Username and Password
    Input Text    id=username_field     demo
    Input Text    id=password_field     mode

Click Login button
    #Click Button    LOGIN
    Submit Form

Found Welcome Page
    Wait Until Element Contains    xpath=//*[@id="container"]/h1    Welcome Page

Check link for logout and be able to click
    Page Should Contain Link    xpath=//*[@id="container"]/p/a    logout
    Click Element    xpath=//*[@id="container"]/p/a

Back to Login Page
    Wait Until Element Contains    xpath=//*[@id="container"]/h1    Login Page



