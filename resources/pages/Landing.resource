*** Settings ***
Documentation    Ações e elementos da Landing Page

Library        Browser

*** Keywords ***
Submit signup form
    [Arguments]    ${account}

    Get Text
    ...    //h2[contains(.,'Faça seu cadastro e venha para a Smartbit!')]
    
    #Preenchimento de dados
    Fill Text
    ...    //input[contains(@placeholder,'Nome completo')]
    ...       ${account}[name]
    Fill Text
    ...    //input[contains(@placeholder,'Seu melhor email')] 
    ...    ${account}[email]
    Fill Text
    ...    //input[contains(@placeholder,'CPF (somente dígitos)')]
    ...    ${account}[cpf]
    
    Click        xpath=//button[@type='submit'][contains(.,'Cadastrar')]
    
