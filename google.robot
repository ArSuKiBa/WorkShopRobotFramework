*** Settings ***
Library    Selenium2Library
Test Teardown    Close Browser
Suite Teardown    Close Browser

*** Variables ***
${BASEURL}   http://www.google.com
${BROWSER}    gc

*** Test Cases ***
Search robot
    Open browser to open google.com
    #Fill in robot
    Fill in data    robot
    Press Enter
    #Found robot in result page
    Found result    Robot - Wikipedia

Search python
    [Tags]    testing
    Open browser to open google.com
    #Fill in python
    Fill in data    python
    Press Enter
    Found result    Welcome to Python.org
    #Found python in result page

*** Keywords ***
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
    #Open Browser    http://www.google.com    browser=gc
    Open Browser    ${BASEURL}    browser=${BROWSER}
