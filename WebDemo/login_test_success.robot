*** Settings ***
Resource   resources/login.robot
Suite Setup    Open browser to open Login Page
Test Teardown    Go back to Login Page
Test Template    Login Success workflow
Suite Teardown    Close Browser

*** Test Cases ***
Login Success    demo    mode