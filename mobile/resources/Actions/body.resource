*** Settings ***

Documentation        Ações e elementos da tela de envio de medidas

Library              AppiumLibrary

*** Keywords ***
Weight and height registration
    [Arguments]    ${account}   

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="myBodytTitle"]    	10

    Input Text    xpath=//android.widget.EditText[@resource-id="weight"]    ${account}[weight]
    Input Text    xpath=//android.widget.EditText[@resource-id="height"]    ${account}[height]

    Click Element    xpath=//android.widget.TextView[@text="Enviar minhas medidas"]