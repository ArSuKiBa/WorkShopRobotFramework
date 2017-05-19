*** Settings ***
Resource   resources/login.robot
Suite Setup    Open browser to open Login Page
Test Teardown    Go back to Login Page
Test Template    Login Fail workflow
Suite Teardown    Close Browser

*** Test Cases ***                  Username        Password
Wrong Username                      username        mode
Wrong Password                      demo            password
Wrong Username and Password         username        password
Missing Username                    ${EMPTY}        mode
Missing Password                    demo            ${EMPTY}
Missing Username and Password       ${EMPTY}        ${EMPTY}


