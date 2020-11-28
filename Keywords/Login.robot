*** Keywords ***
Acces the login page
    Wait Until Element Is Visible    ${Login_Button}
    Click Element    ${Login_Button}
    Wait Until Page Contains    Welcome, Please Sign In!

LoginButton
    Click Element    ${Login}

LoginFields
    [Arguments]    ${valid_email}    ${valid_password}
    Input Text    ${Email_field}    26112020@test.com
    Input Text    ${Password_field}    26112020

Verify that user is succesful loged in
    Wait Until Page Contains    Welcome to our store

Invaldi Cedentials
    [Arguments]    ${Valid_email}    ${Invalid_pass}
    LoginFields

Verify unsuccessful login
    Wait Until Page Contains    Login was unsuccessful. Please correct the errors and try again. No customer account found

Invalid Credentials
    [Arguments]    ${Invalid_Email}    ${Valid_Pass}
    LoginFields

Invalid Credentials(email and pass)
    [Arguments]    ${Invalid_Emai}    ${Invalid_Pass}
    Invalid Credentials    nikola!@yahoo.com    nikola1010

Invalid Credentilas(emptyemail)
    [Arguments]    ${valid_pass}
    Invalid Credentials(empty pass)

RememberMe Checkbox
    Select Checkbox    ${RememberMe}

Verify if the fields for email is nto empty
    Wait Until Element Contains    ${Email_field}    26112020@test.com

Verify if the field for \ password is not empty
    Wait Until Element Contains    ${Password_field}    26112020
