*** Settings ***
Suite Setup       Open Browser    https://demo.nopcommerce.com    chrome
Suite Teardown    Close Browser
Library           SeleniumLibrary

*** Variables ***
${Search_field}    id:small-searchterms
${Search_btn}     //*[@id="small-search-box-form"]/input[2]
${Nokia_Product}    //a[text()='Nokia Lumia 1020']
${Search_keyword}    id:q
${Advanced_search}    id:adv
${Category_Dropdown}    id:cid
${Automatically_search_sub_categories}    id:isc
${Manufacturer_Dropdown}    id:mid
${Price range1}    id:pf
${Price range2}    id:pt
${Search_In_product_descriptions}    id:sid
${Search_Button}    xpath://html/body/div[6]/div[3]/div/div[2]/div/div[2]/div[1]/form/div[2]/input
${Footer_Search}    xpath://html/body/div[6]/div[4]/div[1]/div[2]/ul/li[1]/a
${Fotter_Search_Page}    xpath://html/body/div[6]/div[3]/div/div[2]/div/div[1]/h1

*** Test Cases ***
Search for existing product
    Input text into search field    HTC One Mini Blue
    Search Button
    Verify that product is visible

Search for non-existing product
    Input text into search field    xiaomi
    Search Button
    Verify that produc is not availible on the ecommerce site

Test seach engine if search field is empty
    Search Button
    Pop Up Alert

Test if search works for a less then 3 character keyword
    Input text into search field    HT
    Search Button
    Verify that search works for a less then 3 character

Check if auto-suggestion displays suggestions in the search field
    Input text into search field    Nok
    Search Button
    Verify that autosugestive product is visible

Test auto-suggestions displayed in the search field
    Input text into search field    Nok
    Autosugestive keyboard
    Search Button
    Verify that page contains \ the selected item

Test if the searh is case insensitive
    Input text into search field    nokia lumia 1020
    Search Button
    Verify that search is not lower-case letters sensitive

Run unsuccesful search using the Advanced searh option
    Input text into search field    Xiaomi
    Search Button
    Valid Searhc phrase    Laptop
     Advanced search Checkbox
    Verify that \ Advanced search Checkbox is working
    Category Dropdown
    Verify if automatically search sub categories check box is not selected
    Manufacturer Dropdown
    Price range    1200
    Price Range1    1400
    Search In product descriptions Checkbox
    Verify that Search In product descriptions checkbox is selected
    SubCat Search Button
    Verify that search was unsuccesful

Enter Search page from the link in footer
    Search Page in Footer
    Verify that \ Search page is displayed

*** Keywords ***
Input text into search field
    [Arguments]    ${HTC_One_Mini_Blue}
    Input Text    ${Search_field}    ${HTC_One_Mini_Blue}

Search Button
    Click Element    ${Search_btn}

Verify that product is visible
    Wait Until Element Is Visible    //a[text()='HTC One Mini Blue']

Verify that produc is not availible on the ecommerce site
    Wait Until Page Contains    No products were found that matched your criteria.

Pop Up Alert
    Handle alert    Accept

Verify that search works for a less then 3 character
    Wait Until Page Contains    Search term minimum length is 3 characters

Verify that autosugestive product is visible
    Waith Until Element Is Visible    ${Nokia_Product}

Verify that page contains \ the selected item
    Wait Until Page Contains     Nokia Lumia 1020

Autosugestive keyboard
    Press Keys    ${Search_field}    ARROW_DOWN

Verify that search is not lower-case letters sensitive
    Wait Until Page Contains    Nokia Lumia 1020

Valid Searhc phrase
    [Arguments]    ${Laptop}
    Input Text    ${Search_keyword}    ${Laptop}

Advanced search Checkbox
    Select Checkbox    ${Advanced_search}

Verify that \ Advanced search Checkbox is working
    Checkbox Should Be Selected    ${Advanced_search}

Category Dropdown
    Select From List By Value    ${Category_Dropdown}    1

Verify if automatically search sub categories check box is not selected
    Checkbox Should Not Be Selected    ${Automatically_search_sub_categories}

Manufacturer Dropdown
    Select From List By Label    ${Manufacturer_Dropdown}    HP

Price range
    [Arguments]    ${1200}
    Input Text    ${Price range1}    ${1200}

Price Range1
    [Arguments]    ${1400}
    Input Text    ${Price range2}    ${1400}

Search In product descriptions Checkbox
    Select Checkbox    ${Search_In_product_descriptions}

Verify that Search In product descriptions checkbox is selected
    Checkbox Should Be Selected    ${Search_In_product_descriptions}

SubCat Search Button
    Click Element    ${Search_Button}

Verify that search was unsuccesful
    Wait Until Page Contains    No products were found that matched your criteria.

Search Page in Footer
    Click Element    ${Footer_Search}

Verify that \ Search page is displayed
    Wait Until Element Is Visible    ${Fotter_Search_Page}
