*** Keywords ***
Qaunatity field
    [Arguments]    ${0}
    Input Text    ${Quantity_field}    ${0}

Click on Updat button and verify that user cart is empty
    Click Element    ${Update_cart}
    Wait Until Page Contains    Your Shopping Cart is empty!

Verify that user is on \ shopin cart page
    Wait Until Element Is Visible    xpath://html/body/div[6]/div[3]/div/div/div/div[1]/h1

Click on Pop Up Cart Link
    Click Element    //a[text()='shopping cart']

Click Add to carrt button
    Click Element    ${Add_to_cart}

Navigate to Books menu and verify page
    Click Element    ${Books}
    Wait Until Element Is Visible    ${Books_Page}

Click and verify taht product cart page \ is displayd
    Click Element    ${Pop_upCart}
    Wait Until Element Is Visible    ${Shoping_cart_page}

Click on Levis 501 product
    Click Element    ${Levis511}

Click on Cloting subcategory
    Click Element    ${Clothing_sub}

Verify that Apparel page is dispayed
    Wait Until Element Is Visible    ${Apparel_page}

Navigate to Apparel
    Click Element    ${Apparel}
