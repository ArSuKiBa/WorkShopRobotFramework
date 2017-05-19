*** Settings ***
Library    Selenium2Library
Library    Screenshot

*** Variables ***
${URL}    http://goo.gl/YE27iy
${BROWSER}    gc
${BROWSEBUTTON}    xpath=//*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]
${TABLE}    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/table

*** Test Cases ***
Browse file
    Open browser to open Upload Page
    Choose file to Upload
    Count number of uploaded files
    Upload all files
    Check upload progress
    Check Upload All button
    #Remove file one by one
    #Choose file to Upload
    #Remove all files

*** Keywords ***
Check upload progress
    Wait Until Page Contains Element    xpath=//div[@style="width: 100%;"]

Upload all files
    Click Button    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/div/button[1]

Count number of uploaded files
    Wait Until Element Contains    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/p    Queue length: 2
    Xpath Should Match X Times    //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr    2
    Table Cell Should Contain    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/table    2    1    selenium-screenshot-1.png
    Table Cell Should Contain    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/table    3    1    selenium-screenshot-2.png

Open browser to open Upload Page
    Open Browser    ${URL}    browser=${BROWSER}
    Element Should Be Disabled    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/div/button[1]

Choose file to Upload
    Choose File    ${BROWSEBUTTON}    D:/robotframework/selenium-screenshot-1.png
    Choose File    ${BROWSEBUTTON}    D:/robotframework/selenium-screenshot-2.png
    Element Should Be Enabled    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/div/button[1]

Remove file one by one
    Click Button    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[1]/td[5]/button[3]
    Click Button    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr/td[5]/button[3]

Remove all files
    Click Button    xpath=//*[@id="ng-app"]/body/div/div[2]/div[2]/div/button[3]
