*** Settings ***
Library        SeleniumLibrary
Resource       CommonKeywords.robot

*** Keywords ***
Add Product To Cart
    ${selected_product_name}=    Get Text    xpath=(//div[@data-test="inventory-item-name"])[1]
    Set Suite Variable    ${selected_product_name}
    CommonKeywords.Wait until element is ready then click element    xpath=(//button[contains(text(), 'Add to cart')])[1]

Verify Product Name In Cart Matches Selected
    ${cart_product_name}=    Get Text    css=.inventory_item_name
    Should Be Equal    ${cart_product_name}    ${selected_product_name}

Remove Product In Cart
    CommonKeywords.Wait until element is ready then click element    xpath=(//button[contains(text(), 'Remove')])[1]

Cart Should Be Empty
    ${item_count}=    Get Element Count    css=div.cart_item
    Should Be Equal As Integers    ${item_count}    0

Click continue shopping button
    CommonKeywords.Wait until element is ready then click element    xpath=(//button[@id="continue-shopping"])

Go To Product Page
    Wait Until Location Is    https://www.saucedemo.com/inventory.html    timeout=30s
    Location Should Be        https://www.saucedemo.com/inventory.html

Click checkout button
    CommonKeywords.Wait until element is ready then click element    xpath=(//button[@id="checkout"])

Go To Information Page
    Wait Until Location Is    https://www.saucedemo.com/checkout-step-one.html    timeout=20s
    Location Should Be        https://www.saucedemo.com/checkout-step-one.html
