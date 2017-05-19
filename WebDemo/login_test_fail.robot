*** Settings ***
Resource   resources/login.robot
Suite Setup    Open browser to open Login Page
Test Teardown    Close Browser

*** Test Cases ***
Login rule
    [Template]    Login Fail workflow
    demo    password
    username    mode
    username    password
    ${EMPTY}    mode
    demo    ${EMPTY}
    ${EMPTY}    ${EMPTY}

