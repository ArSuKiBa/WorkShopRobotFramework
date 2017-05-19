*** Settings ***
Resource   resources/login.robot
Suite Setup    Open browser to open Login Page
Test Teardown    Close Browser

*** Variables ***
${LOGINURL}   http://localhost:7272
${BROWSER}    gc

*** Test Cases ***
Search rule
    [Template]    Login Success workflow
    demo    mode