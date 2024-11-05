*** Settings ***
Documentation        Ações e elementos da tela de login

Library        AppiumLibrary

Resource       ../Variables/variables.resource
Resource       Components/popup.resource

*** Keywords ***

Signin with document
    [Arguments]    ${cpf}

    Input Text       xpath=//android.widget.EditText[@resource-id="ipAddress"]
    ...    ${ipAPI}
    Input Text       xpath=//android.widget.EditText[@resource-id="cpf"]
    ...   ${cpf} 

    Click Element    xpath=//android.view.ViewGroup[@resource-id="btnLogin"]

Login attempt with incorrect CPF
    [Arguments]        ${cpf}    ${return}
    
    Signin with document        ${cpf}
    Popup have text             ${return}    


    
    