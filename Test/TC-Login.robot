*** Settings ***
Suite Setup       Open Browser    https://demo.nopcommerce.com    chrome
Suite Teardown    Close Browser
Library           SeleniumLibrary
Resource          ../Keywords/Login.robot
Resource          ../Locators/LoginLocators.robot

*** Test Cases ***
Check if login page is accesible
    [Setup]    Open Browser    https://demo.nopcommerce.com    chrome
    Acces the login page
    [Teardown]    Close Browser

Login with valid credentials
    [Setup]    Open Browser    https://demo.nopcommerce.com    chrome
    Acces the login page
    LoginFields    26112020@test.com    26112020
    LoginButton
    Verify that user is succesful loged in
    [Teardown]    Close Browser

Login with valid Email and Invalid Password
    Acces the login page
    Invaldi Cedentials    26112020@test.com    nikola1
    LoginButton
    Verify unsuccessful login

Login with invalid Email and Valid Pass
    Acces the login page
    Invalid Credentials    nikola1@gmail.com    26112020
    LoginButton
    Verify unsuccessful login

Login with Invalid email and Invalid Pass
    Acces the login page
    Invalid Credentials(email and pass)    nikola@yahoo.com    nikola1010
    LoginButton
    Verify unsuccessful login

Login with empty email and valid pass
    Acces the login page
    Invalid Credentilas(emptyemail)    26112020
    LoginButton
    Verify unsuccessful login

Verify the checkbox Remember me is working
    Acces the login page
    LoginFields    26112020@test.com    26112020
    RememberMe Checkbox
    LoginButton
    Verify that user is succesful loged in
    Verify if the fields for email is nto empty
    Verify if the field for \ password is not empty

*** Keywords ***
