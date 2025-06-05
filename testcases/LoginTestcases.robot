*** Settings ***
Library           SeleniumLibrary
Resource          ../keywords/LoginKeywords.robot
Variables         ../resources/config/config.yaml
Variables         ../resources/testdata/testdata.yaml
Resource         ../keywords/HomePageKeywords.robot
Suite Setup       Open Browser    ${baseUrl}    chrome
Suite Teardown    Close Browser


*** Test Cases ***

User cannot login with invalid credentials
    go to login page
    When user login with username ${invalid_username} and password ${invalid_password}
    Then login should fail with error message "Epic sadface: Username and password do not match any user in this service"

User cannot login without username
    go to login page
    When user login with username ${empty} and password ${valid_password}
    Then login should fail with error message "Epic sadface: Username is required"

User cannot login without password
    go to login page
    When user login with username ${valid_username} and password ${empty}
    Then login should fail with error message "Epic sadface: Password is required"

User cannot login without username and password
    go to login page
    user login with username ${empty} and password ${empty}
    Then login should fail with error message "Epic sadface: Username is required"

User can login with valid credentials
    When user login with username ${valid_username} and password ${valid_password}
    Then login should be successful and user should see inventory page
    [Teardown]    user logout from swag labs platform

