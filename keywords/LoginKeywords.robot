*** Settings ***
Library        SeleniumLibrary
Resource       CommonKeywords.robot

*** Keywords ***

go to login page
    Go To    https://www.saucedemo.com
    CommonKeywords.Wait Until Page Contains Element    id=user-name

user login with username ${username} and password ${password}
    CommonKeywords.Wait until element is ready then input text    id=user-name    ${username}
    CommonKeywords.Wait until element is ready then input text    id=password    ${password}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@type="submit"]

login should be successful and user should see inventory page
    CommonKeywords.Wait until page contains element    xpath=//div[@id="inventory_container"]

login should fail with error message "${expected_text}"
    CommonKeywords.Wait until error message contains text    ${expected_text}

