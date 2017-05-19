*** Settings ***
Resource   resources/share.robot
Suite Setup    Open browser to open google.com
Suite Teardown    Close Browser

*** Variables ***
${BASEURL}   http://www.google.com
${BROWSER}    gc

*** Test Cases ***
Search rule
    [Template]    Search workflow
    pythonx    Not found pythonx
    robotx    Not Found robotx
