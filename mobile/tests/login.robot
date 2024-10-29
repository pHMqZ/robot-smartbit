*** Settings ***
Documentation        Suite de testes de login no app

Resource            ../resources/Base.resource

Test Setup          Star session
Test Teardown       Finish session

*** Test Cases ***
Login com IP e CPF

    Input Text       xpath=//android.widget.EditText[@resource-id="ipAddress"]    ${ipAPI}
    Input Text       xpath=//android.widget.EditText[@resource-id="cpf"]          	87181025066

    Click Element    xpath=//android.view.ViewGroup[@resource-id="btnLogin"]

    Wait Until Element Is Visible    xpath=//android.widget.TextView[@resource-id="myAccountTitle"]    15

    Element Text Should Be    xpath=//android.widget.TextView[@resource-id="myAccountTitle"]    Sua transformação começa aqui!