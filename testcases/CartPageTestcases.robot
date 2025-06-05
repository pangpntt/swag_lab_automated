*** Settings ***
Library            SeleniumLibrary
Resource           ../keywords/ProductPageKeywords.robot
Resource           ../keywords/LoginKeywords.robot
Resource           ../keywords/CartPageKeywords.robot
Variables          ../resources/config/config.yaml
Variables          ../resources/testdata/testdata.yaml
Suite Setup        Open Browser    ${baseUrl}    chrome
Suite Teardown     Close Browser


*** Test Cases ***
Cart item matches the selected product from product page
    user login with username ${valid_username} and password ${valid_password}
    CommonKeywords.Wait until page contains element    css=button.btn_inventory
    Add Product To Cart
    Verify First Product Button Is Remove
    ${cart_count}=    Get Cart Badge Count
    Should Be Equal As Integers    ${cart_count}    1
    Click Cart Icon
    Go To Cart Page
    Verify Product Name In Cart Matches Selected

User remove product in cart
    Remove Product In Cart
    Cart Should Be Empty

๊User navigate to product page
    Click continue shopping button
    Go To Product Page

User navigate to Information page
    Go To Cart Page
    Click checkout button
    Go To Information Page
