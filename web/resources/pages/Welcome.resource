*** Settings ***
Documentation        Ações e elementos da página de boas vindas

*** Keywords ***
Verify welcome message
    Wait For Elements State
        ...    //h2[contains(.,'Falta pouco para fazer parte da família Smartbit!')]
        ...    visible    5
