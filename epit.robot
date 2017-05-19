*** Settings ***
Library    Selenium2Library

*** Variables ***

*** Test Cases ***
Check Error when click Next
    Open browser to open forgot password page
    Click Next button
    Found error message

Cancel Logout
    Open browser to open forgot password page
    Cancle Logout
    Back to forgot password page

Confirm Logout
    [Tags]    testing
    Open browser to open forgot password page
    Confirm Logout
    Back to first page

*** Keywords ***
Back to first page
    Location Should Be    http://epit.rd.go.th/publish/index.php

Back to forgot password page
    Wait Until Page Contains Element    id=head_reg_type_1

Cancle Logout
    Choose Cancel On Next Confirmation
    Click Element    name=bExit
    Confirm Action

Confirm Logout
    Click Element    name=bExit
    Confirm Action

Found confirmation message
    ${MESSAGE}=    Get Alert Message
    Should Contain    ${MESSAGE}    [W001]

Open browser to open forgot password page
    Open Browser    https://epit.rd.go.th/EFILING/RegController#    browser=gc
    Click Element     name=link_RegType1

Found error message
    ${MESSAGE}=    Get Alert Message
    Should Contain    ${MESSAGE}    [E011]



