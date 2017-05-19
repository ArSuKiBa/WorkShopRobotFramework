*** Settings ***
Library    Selenium2Library

*** Keywords ***
Search workflow
    [Arguments]    ${search keyword}    ${result}
    Fill in data    ${search keyword}
    Press Enter
    Found result    ${result}
    Go To    ${BASEURL}

Fill in data
    [Arguments]    ${search keyword}
    Input Text    name=q    ${search keyword}

Fill in python
    Input Text    name=q    python

Found result
    [Arguments]    ${result}
    Wait Until Page Contains    ${result}

Found python in result page
    Wait Until Page Contains    Welcome to Python.org

Found robot in result page
    Wait Until Page Contains    Robot - Wikipedia

Press Enter
	Press Key    name=q    \\13

Fill in robot
    Input Text    name=q    robot

Open browser to open google.com
    Open Browser    ${BASEURL}    browser=${BROWSER}
