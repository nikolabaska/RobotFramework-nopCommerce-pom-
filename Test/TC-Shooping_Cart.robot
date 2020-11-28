*** Settings ***
Suite Setup       Open Browser    https://demo.nopcommerce.com    chrome
Suite Teardown    Close Browser
Library           SeleniumLibrary

*** Variables ***
${Apparel}        xpath://html/body/div[6]/div[2]/ul[1]/li[3]/a
${Apparel_page}    xpath://html/body/div[6]/div[3]/div[2]/div[2]/div/div[1]/h1
${Clothing_sub}    xpath://html/body/div[6]/div[3]/div[2]/div[1]/div[1]/div[2]/ul/li[3]/ul/li[2]/a
${Levis511}       xpath://html/body/div[6]/div[3]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div[2]/div[3]/div[2]/input[1]
${Pop_upCart}     xpath://html/body/div[5]/div/p/a
${Shoping_cart_page}    xpath://html/body/div[6]/div[3]/div/div/div/div[1]/h1
${Books}          xpath://html/body/div[6]/div[2]/ul[1]/li[5]/a
${Add_to_cart}    xpath://html/body/div[6]/div[3]/div[2]/div[2]/div/div[2]/div[3]/div/div[3]/div/div[2]/div[3]/div[2]/input[1]
${CartLink}       //a[text()='shopping cart']
${Update_cart}    //*[@id="shopping-cart-form"]/div[2]/div[1]/input[1]
${Books_Page}     xpath://html/body/div[6]/div[3]/div[2]/div[2]/div/div[1]/h1
${Quantity_field}    id:itemquantity11243
${Remove}         xpath://html/body/div[6]/div[3]/div/div/div/div[2]/div/form/div[1]/table/tbody/tr/td[1]/input

*** Test Cases ***
Add product to cart
    Navigate to Apparel
    Verify that Apparel page is dispayed
    Click on Cloting subcategory
    Click on Levis 501 product
    Click and verify taht product cart page \ is displayd

Remove product from Cart
    Navigate to Books menu and verify page
    Click Add to carrt button
    Sleep    5
    Click on Pop Up Cart Link
    Sleep    5
    Verify that user is on \ shopin cart page
    FOR    ${i}    IN RANGE    1
    Select Checkbox    ${Remove}
    Click on Updat button and verify that user cart is empty
    END

Remove product from Cart by entering 0 in quantity field
    Navigate to Books menu and verify page
    Click Add to carrt button
    Click on Pop Up Cart Link
    Qaunatity field    0
    Click on Updat button and verify that user cart is empty

Check if the same product is possible to be added multiple times
    Navigate to Apparel
    Verify that Apparel page is dispayed
    Click on Cloting subcategory
    Click on Levis 501 product
    Click on Levis 501 product
    Click and verify taht product cart page \ is displayd

Check the hover functionality of the shopping cart icon when the shoping cart is empty
    Mouse Over    //*[@id="topcartlink"]/a
    Wait Until Element Is Visible    //*[@id="flyout-cart"]/div/div

*** Keywords ***
Navigate to Apparel
    Click Element    ${Apparel}

Verify that Apparel page is dispayed
    Wait Until Element Is Visible    ${Apparel_page}

Click on Cloting subcategory
    Click Element    ${Clothing_sub}

Click on Levis 501 product
    Click Element    ${Levis511}

Click and verify taht product cart page \ is displayd
    Click Element    ${Pop_upCart}
    Wait Until Element Is Visible    ${Shoping_cart_page}

Navigate to Books menu and verify page
    Click Element    ${Books}
    Wait Until Element Is Visible    ${Books_Page}

Click Add to carrt button
    Click Element    ${Add_to_cart}

Click on Pop Up Cart Link
    Click Element    //a[text()='shopping cart']

Verify that user is on \ shopin cart page
    Wait Until Element Is Visible    xpath://html/body/div[6]/div[3]/div/div/div/div[1]/h1

Click on Updat button and verify that user cart is empty
    Click Element    ${Update_cart}
    Wait Until Page Contains    Your Shopping Cart is empty!

Qaunatity field
    [Arguments]    ${0}
    Input Text    ${Quantity_field}    ${0}
