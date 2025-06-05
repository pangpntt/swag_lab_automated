*** Settings ***
Library        SeleniumLibrary
Resource       CommonKeywords.robot

*** Keywords ***
user logout from swag labs platform
    Wait Until Element Is Visible    id=react-burger-menu-btn
    Click Element    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link
    Click Element    id=logout_sidebar_link
