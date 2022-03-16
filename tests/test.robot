*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Test Teardown   Close Browser

*** Variables ***
${Error_message_Login}  css:.alert-danger

*** Test Cases ***
Validate Unsuccessful Login
    open the browser with the Mortgage payment url
    Fill in the login Form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome      executable_path=/Users/aaroncarter/Downloads/chromedriver
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill in the login Form
    Input Text  id:username     myname
    Input Password  id:password     password
    Click Button    id:signInBtn

wait until it checks and display error message
    Wait Until Element is Visible       ${Error_message_Login}

verify error message is correct
#        ${result} =     Get Text    ${Error_message_Login}
#        Should Be Equal As Strings      ${result}       Incorrect username/password.
        mouse out              id:username
        sleep       5
        Element Text Should be      ${Error_message_Login}      Incorrect username/password.
