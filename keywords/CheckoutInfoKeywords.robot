*** Settings ***
Library            SeleniumLibrary
Resource           ../keywords/CommonKeywords.robot

*** Keywords ***
click continue button
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@type="submit" and @id="continue"]

user input field with firstname ${firstName} lastname ${lastName} and zipcode ${postalCode}
    CommonKeywords.Wait until element is ready then input text    id=first-name    ${firstName}
    CommonKeywords.Wait until element is ready then input text    id=last-name    ${lastName}
    CommonKeywords.Wait until element is ready then input text    id=postal-code    ${postalCode}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@type="submit"]

*** Keywords ***
user fail go to overview page
    [Arguments]    ${expected_text}
    CommonKeywords.Wait Until Page Contains Element    css=h3[data-test="error"]
    Element Should Contain    css=h3[data-test="error"]    ${expected_text}

