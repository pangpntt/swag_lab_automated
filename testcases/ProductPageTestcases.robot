*** Settings ***
Library            SeleniumLibrary
Resource           ../keywords/ProductPageKeywords.robot
Resource           ../keywords/LoginKeywords.robot
Resource           ../keywords/CommonKeywords.robot
Variables          ../resources/config/config.yaml
Variables          ../resources/testdata/testdata.yaml
Suite Setup        Open Browser    ${baseUrl}    chrome
Suite Teardown     Close Browser

*** Test Cases ***
User can add and remove product then verify cart update
    user login with username ${valid_username} and password ${valid_password}
    CommonKeywords.Wait until page contains element    css=button.btn_inventory

    # Add product
    Add First Product To Cart
    Verify First Product Button Is Remove

    ${cart_count}=    Get Cart Badge Count
    Should Be Equal As Integers    ${cart_count}    1

    # Remove product
    Remove First Product From Cart
    Verify First Product Button Is Add To Cart
    Element Should Not Be Visible    css=.shopping_cart_badge

User can sort product name from A-Z correctly
    CommonKeywords.Wait until page contains element    css=.product_sort_container
    Sort Product By Name A To Z
    @{names}=    Get All Product Names
    ${sorted}=   Copy List    ${names}
    Sort List    ${sorted}
    Should Be Equal    ${names}    ${sorted}

User can sort product name from Z-A correctly
    CommonKeywords.Wait until page contains element    css=.product_sort_container
    Sort Product By Name Z To A
    @{names}=    Get All Product Names
    ${sorted}=   Copy List    ${names}
    Sort List    ${sorted}
    Reverse List    ${sorted}
    Should Be Equal    ${names}    ${sorted}

User can sort product name from price low to high correctly
    CommonKeywords.Wait until page contains element    css=.product_sort_container
    Sort Product By Price low To high
    @{price}=    Get All Product Prices
    ${sort}=    Copy List    ${price}
    Sort List    ${sort}
    Should Be Equal    ${price}    ${sort}

User can sort product name from price high to low correctly
    CommonKeywords.Wait until page contains element    css=.product_sort_container
    Sort Product By Price high To low
    @{price}=    Get All Product Prices
    ${sort}=    Copy List    ${price}
    Sort List    ${sort}
    Reverse List    ${sort}
    Should Be Equal    ${price}    ${sort}

User can click cart icon navigate to cart page
    Click Cart Icon
    Go To Cart Page
    
