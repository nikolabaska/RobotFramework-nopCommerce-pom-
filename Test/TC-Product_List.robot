*** Settings ***
Suite Setup       Open Browser    https://demo.nopcommerce.com    chrome
Suite Teardown    Close Browser
Library           SeleniumLibrary

*** Variables ***
${Computers}      //a[text()='Computers '][1]
${Notebooks}      xpath://html/body/div[6]/div[2]/ul[1]/li[1]/ul/li[2]/a
${Hp_Envy_Product}    //a[text()='HP Envy 6-1180ca 15.6-Inch Sleekbook']
${CPU_Type}       xpath://html/body/div[6]/div[3]/div[2]/div[2]/div/div[2]/div[2]/div/div[2]/div/ul[1]/li[2]/a
${Memory}         xpath://html/body/div[6]/div[3]/div[2]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/ul[2]/li[3]/a
${Samsung_Product}    xpath://html/body/div[6]/div[3]/div[2]/div[2]/div/div[2]/div[3]/div/div/div/div[2]/h2/a
${CPU_Verify}     xpath://html/body/div[6]/div[3]/div[2]/div[2]/div/div[2]/div[2]/div/div[2]/div[2]/ul/li[2]
${Remove_Filter}    //a[text ()='Remove Filter']
${Electronics}    //a[text ()='Electronics ']
${Camera_and_Photo}    xpath://html/body/div[6]/div[2]/ul[1]/li[2]/ul/li[1]/a
${Add_to_cart}    xpath://html/body/div[6]/div[3]/div[2]/div[2]/div/div[2]/div[3]/div/div[1]/div/div[2]/div[3]/div[2]/input[1]
${Quantity_field}    id:product_enteredQuantity_14
${Add_to_cart_button}    id:add-to-cart-button-14
${pop_up_not}     //*[@id="bar-notification"]/div/p

*** Test Cases ***
Confirm that Hp Notebook can be found in computers category
    Navigate to Computers Menu
    Verify the Computers menu
    Navigate to Notebooks submenu
    Click on Notebooks subemnu
    Select Hp_Envy product
    Verify the product is visible

Verify the filter option is working
    Navigate to Computers Menu
    Navigate to Notebooks submenu
    Click on Notebooks subemnu
    CPU Filter by attributes
    Verify that CPU Type is visible in Filter by attributes
    Memory Filter by attributes
    Verify that Memory type is visible
    Click on Samsung Product
    Verify that \ Samsung produt is visible

Check if the button REMOVE FILTER is clearing the filtered choises
    Navigate to Computers Menu
    Navigate to Notebooks submenu
    Click on Notebooks subemnu
    CPU Filter by attributes
    Verify that CPU Type is visible in Filter by attributes
    Memory Filter by attributes
    Verify that Memory type is visible
    Remove filter button
    Verify that Remove filter button works

Verify Add to cart should work properly with awailible products
    Navigate to Electronics menu
    Navigate to Camera&Photo submenu
    Click on CameraandPhoto Submenu
    Verify that Camera&Photo page is visible
    Click on add to cart button
    Verify that producit is avalible
    Input product quantity    2
    Click on add to cart
    Verify that product is added to cart

Verify Add to cart should work properly with unawailible products
    Navigate to Electronics menu
    Navigate to Camera&Photo submenu
    Clicl Element    xpath://html/body/div[6]/div[3]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div[2]/h2/a

*** Keywords ***
Navigate to Computers Menu
    Mouse Over     ${Computers}

Verify the Computers menu
    Wait Until Element Is Visible    ${Computers}

Navigate to Notebooks submenu
    Mouse Over    ${Notebooks}

Click on Notebooks subemnu
    Click Element    ${Notebooks}

Select Hp_Envy product
    Click Element    ${Hp_Envy_Product}

Verify the product is visible
    Wait Until Page Contains    HP Envy 6-1180ca 15.6-Inch Sleekbook

CPU Filter by attributes
    Click Element    ${CPU_Type}

Verify that CPU Type is visible in Filter by attributes
    Wait Until Element Is Visible    ${CPU_Verify}

Memory Filter by attributes
    Click Element    ${Memory}

Verify that Memory type is visible
    Wait Until Page Contains    Memory: 8 GB

Click on Samsung Product
    Click Element    ${Samsung_Product}

Verify that \ Samsung produt is visible
    Wait Until Page Contains    Samsung Series 9 NP900X4C Premium Ultrabook

Remove filter button
    Click Element    ${Remove_Filter}

Verify that Remove filter button works
    Wait Until Element Is Visible    ${CPU_Type}

Navigate to Electronics menu
    Mouse Over    ${Electronics}

Navigate to Camera&Photo submenu
    Mouse Over    ${Camera_and_Photo}

Click on CameraandPhoto Submenu
    Click Element    ${Camera_and_Photo}

Verify that Camera&Photo page is visible
    Waith Until Element Is Visible    xpath://html/body/div[6]/div[3]/div[2]/div[2]/div/div[1]/h1

Click on add to cart button
    Click Elelement    ${Add_to_cart}

Verify that producit is avalible
    Wait Until Page Contains    Nikon D5500 DSLR

Input product quantity
    [Arguments]    ${2}
    Input Text    ${Quantity_field}    ${2}

Click on add to cart
    Click Element    ${Add_to_cart_button}

Verify that product is added to cart
    Wait Until Element Is Visible    ${pop_up_not}
