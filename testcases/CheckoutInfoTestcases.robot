*** Settings ***
Library            SeleniumLibrary
Resource           ../keywords/CheckoutInfoKeywords.robot
Resource           ../keywords/LoginKeywords.robot
Resource           ../keywords/CartPageKeywords.robot
Resource           ../keywords/ProductPageKeywords.robot
Variables          ../resources/config/config.yaml
Variables          ../resources/testdata/testdata.yaml
Suite Setup        Open Browser    ${baseUrl}    chrome
Suite Teardown     Close Browser

*** Test Cases ***
User cannot go to overview information page
    user login with username ${valid_username} and password ${valid_password}
    CommonKeywords.Wait until page contains element    css=button.btn_inventory
    Add Product To Cart
    Verify First Product Button Is Remove
    ${cart_count}=    Get Cart Badge Count
    Should Be Equal As Integers    ${cart_count}    1
    Click Cart Icon
    Go To Cart Page
    Verify Product Name In Cart Matches Selected
    Click checkout button
    Go To Information Page
    click continue button
    user fail go to overview page    Error: First Name is required

๊User cannot go to overview information page without First Name
    user input field with firstname ${empty} lastname ${lastName} and zipcode ${postalCode}
    user fail go to overview page    Error: First Name is required

๊User cannot go to overview information page without Last Name
    user input field with firstname ${firstName} lastname ${empty} and zipcode ${postalCode}
    user fail go to overview page    Error: Last Name is required

๊User cannot go to overview information page without zipcode
    user input field with firstname ${firstName} lastname ${lastName} and zipcode ${empty}
    user fail go to overview page    Error: Postal Code is required

User can go to overview information page
    user input field with firstname ${firstName} lastname ${lastName} and zipcode ${postalCode}
    