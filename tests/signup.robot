*** Settings ***
Documentation    Cenários de testes de pré-cadastro de clientes

Library    Browser

Resource    ../resources/base.resource

*** Test Cases ***
Deve iniciar o cadastro do cliente com sucesso

    ${account}    Get Fake Account
    
    #Preparação para os testes
    New Browser    browser=chromium     headless=False    
    New Page    http://localhost:3000/

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
    ...    ${account}[document]
    
    Click        xpath=//button[@type='submit'][contains(.,'Cadastrar')]

    #Validação de dados
    Wait For Elements State
    ...    //h2[contains(.,'Falta pouco para fazer parte da família Smartbit!')]
    ...    visible    5


Validação de campos obrigatórios - Nome
    #[Tags]    required    tag para rodar apenas esse teste

    ${account}    Get Fake Account
    
    #Preparação para os testes
    New Browser    browser=chromium     headless=False    
    New Page    http://localhost:3000/

    Get Text
    ...    //h2[contains(.,'Faça seu cadastro e venha para a Smartbit!')]
    
    #Preenchimento de dados
    Fill Text
    ...    //input[contains(@placeholder,'Seu melhor email')] 
    ...    ${account}[email]
    Fill Text
    ...    //input[contains(@placeholder,'CPF (somente dígitos)')]
    ...    ${account}[document]
    
    Click        xpath=//button[@type='submit'][contains(.,'Cadastrar')]

    #Validação de dados
    Wait For Elements State
    ...    xpath=//div[@class='notice'][contains(.,'Por favor informe o seu nome completo')]
    ...    visible    5


Validação de campos obrigatórios - Email
    #[Tags]    required

    ${account}    Get Fake Account
    
    #Preparação para os testes
    New Browser    browser=chromium     headless=False    
    New Page    http://localhost:3000/

    Get Text
    ...    //h2[contains(.,'Faça seu cadastro e venha para a Smartbit!')]
    
    #Preenchimento de dados
    Fill Text
    ...    //input[contains(@placeholder,'Nome completo')]
    ...       ${account}[name]
    Fill Text
    ...    //input[contains(@placeholder,'CPF (somente dígitos)')]
    ...    ${account}[document]
    
    Click        xpath=//button[@type='submit'][contains(.,'Cadastrar')]

    #Validação de dados
    Wait For Elements State
    ...    xpath=//div[@class='notice'][contains(.,'Por favor, informe o seu melhor e-mail')]
    ...    visible    5


Validação de campos obrigatórios - CPF
    [Tags]    required

    ${account}    Get Fake Account
    
    #Preparação para os testes
    New Browser    browser=chromium     headless=False    
    New Page    http://localhost:3000/

    Get Text
    ...    //h2[contains(.,'Faça seu cadastro e venha para a Smartbit!')]
    
    #Preenchimento de dados
    Fill Text
    ...    //input[contains(@placeholder,'Nome completo')]
    ...       ${account}[name]
    Fill Text
    ...    //input[contains(@placeholder,'Seu melhor email')] 
    ...    ${account}[email]
    
    Click        xpath=//button[@type='submit'][contains(.,'Cadastrar')]

    #Validação de dados
    Wait For Elements State
    ...    xpath=//div[@class='notice'][contains(.,'Por favor, informe o seu CPF')]
    ...    visible    5