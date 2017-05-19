*** Settings ***
Library    Selenium2Library
Library    Screenshot
Test Teardown    Close Browser


*** Variables ***
${FBURL}   http://www.facebook.com
${BROWSER}    gc

*** Test Cases ***
Sign Up facebook
    Open browser to open Sign Up Page
    Fill in First Name and Surname
    Fill in email address
    Fill in confirm email address
    Fill in Password
    Select birthday
    Select gender
    Submit
    Found error message

*** Keywords ***
Open browser to open Sign Up Page
    Open Browser    ${FBURL}    browser=${BROWSER}
    Take Screenshot

Fill in First Name and Surname
    Input Text    name=firstname     Su
    Input Text    name=lastname     Kiddee
    Take Screenshot

Fill in email address
    Input Text    name=reg_email__    aaa@gmial.com
    Take Screenshot

Fill in confirm email address
    Input Text    name=reg_email_confirmation__    aaa@gmial.com

Fill in Password
    Input Text    name=reg_passwd__    passpass

Select birthday
    Select From List By Value    name=birthday_day    15
    Select From List By Value    name=birthday_month    5
    Select From List By Value    name=birthday_year    1985

Select gender
    Select Radio Button    sex    1

Submit
    Click Button    สร้างบัญชีผู้ใช้
    Take Screenshot

Found error message
    Wait Until Element Is Visible    id=reg_error_inner
    ${text}=    Get Text    id=reg_error_inner
    Log to console    ${text}
    Should Contain    ${text}    คุณป้อนอีเมลไม่ถูกต้อง โปรดตรวจสอบที่อยู่อีเมลแล้วลองอีกครั้ง
    Should Be Equal    ${text}    คุณป้อนอีเมลไม่ถูกต้อง โปรดตรวจสอบที่อยู่อีเมลแล้วลองอีกครั้ง
    Take Screenshot

    #Wait Until Element Contains    id=reg_error_inner    คุณป้อนอีเมลไม่ถูกต้อง โปรดตรวจสอบที่อยู่อีเมลแล้วลองอีกครั้ง



