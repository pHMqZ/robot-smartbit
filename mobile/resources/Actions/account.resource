*** Settings ***
Documentation        Ações e elementos da tela de conta do usuário


Library        AppiumLibrary

*** Keywords ***
User is logged in
    
    ${element}    Set Variable     xpath=//android.widget.TextView[@resource-id="myAccountTitle"]

    Wait Until Element Is Visible   ${element} 
    ...    15

    Element Text Should Be    ${element} 
    ...    Sua transformação começa aqui!