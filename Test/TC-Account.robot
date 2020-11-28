*** Settings ***
Suite Setup       Open Browser    https://demo.nopcommerce.com    chrome
Suite Teardown    Close Browser
Library           SeleniumLibrary
Resource          ../Keywords/Login.robot
Resource          ../Locators/LoginLocators.robot
Resource          ../Keywords/AccountKeywords.robot
Resource          ../Locators/AccountLocators.robot

*** Test Cases ***
Access my account page
    Acces the login page
    LoginFields    niki@gmail.com    123456
    LoginButton
    Verify that user is succesful loged in
    Click and Verify my account page

Change Personal details in customer info
    Acces the login page
    LoginFields    niki@gmail.com    123456
    LoginButton
    Verify that user is succesful loged in
    Click and Verify my account page
    Change Email    niki33@gmail.com
    Click on Save Button
    Click on Log Out
    Acces the login page
    LoginFields    niki33@gmail.com    123456
    Click and Verify my account page

Add address to my account
    Acces the login page
    LoginFields    niki33@gmail.com    123456
    LoginButton
    Verify that user is succesful loged in
    Click and Verify my account page
    Click on Address subcategory
    Add New Address
    Verify that new address page is visible
    Fill the First name last name and email fields    Tom    Legend    legendone@email.com
    Select From List By Label    ${CountryDropdown}    Macedonia
    Fill the City \ New address and Zipp code fields    Bitola    Karposh 14    7000
    Input Phone number    047222888
    Click save and verify that address are update

Edit address in my account
    Acces the login page
    LoginFields    niki33@gmail.com    123456
    LoginButton
    Verify that user is succesful loged in
    Click and Verify my account page
    Click on Address subcategory
    Edit New Address
    Input Phone number    077 777 444

Check if Back in stock subscriptions link leads to My account - Back in stock subscriptions section
    Acces the login page
    LoginFields    niki@gmail.com    123456
    LoginButton
    Verify that user is succesful loged in
    Click and Verify my account page
    Click And verify Back inStock

Check if Reward points link leads to My account - My account - Reward points section
    Acces the login page
    LoginFields    niki@gmail.com    123456
    LoginButton
    Verify that user is succesful loged in
    Click and Verify my account page
    Click and verify My account - Reward points section

Check if My product reviews link leads to My account - My product reviews section
    Acces the login page
    LoginFields    niki@gmail.com    123456
    LoginButton
    Verify that user is succesful loged in
    Click and Verify my account page
    Click and verify My product review functionality

*** Keywords ***
