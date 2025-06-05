*** Settings ***
Library        SeleniumLibrary
Library        Collections
Resource       CommonKeywords.robot
Resource       LoginKeywords.robot

*** Keywords ***
Add First Product To Cart
    CommonKeywords.Wait until element is ready then click element    xpath=(//button[contains(text(), 'Add to cart')])[1]

Remove First Product From Cart
    CommonKeywords.Wait until element is ready then click element    xpath=(//button[contains(text(), 'Remove')])[1]

Verify First Product Button Is Remove
    CommonKeywords.Wait until page contains element    xpath=(//button[contains(@class, 'btn_inventory')])[1]
    Element Text Should Be              xpath=(//button[contains(@class, 'btn_inventory')])[1]    Remove

Verify First Product Button Is Add To Cart
    CommonKeywords.Wait until page contains element   xpath=(//button[contains(@class, 'btn_inventory')])[1]
    Element Text Should Be             xpath=(//button[contains(@class, 'btn_inventory')])[1]    Add to cart

Get Cart Badge Count
    ${cart_text}=    Get Text    css=.shopping_cart_badge
    ${cart_number}=  Convert To Integer    ${cart_text}
    RETURN    ${cart_number}

Sort Product By Name A To Z
    CommonKeywords.Wait until element is ready then click element    css=.product_sort_container
    Select From List By Label                       css=.product_sort_container    Name (A to Z)

Sort Product By Name Z To A
    CommonKeywords.Wait until element is ready then click element    css=.product_sort_container
    Select From List By Label                       css=.product_sort_container    Name (Z to A)

Sort Product By Price low To high
    CommonKeywords.Wait until element is ready then click element    css=.product_sort_container
    Select From List By Label                       css=.product_sort_container    Price (low to high)

Sort Product By Price high To low
    CommonKeywords.Wait until element is ready then click element    css=.product_sort_container
    Select From List By Label                       css=.product_sort_container    Price (high to low)

Get All Product Names
    ${elements}=    Get WebElements    css=.inventory_item_name
    @{names}=       Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${names}    ${text}
    END
    RETURN    ${names}

Get All Product Prices
    ${elements}=    Get WebElements    css=.inventory_item_price
    @{prices}=      Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        ${price}=   Convert To Number    ${text.strip('$')}
        Append To List    ${prices}    ${price}
    END
    RETURN    ${prices}

Click Cart Icon
    Wait Until Element Is Visible    css=.shopping_cart_link    timeout=20s
    Click Element    css=.shopping_cart_link
    Log    Clicked cart icon


Go To Cart Page
    Wait Until Location Is    https://www.saucedemo.com/cart.html    timeout=10s
    Location Should Be        https://www.saucedemo.com/cart.html


