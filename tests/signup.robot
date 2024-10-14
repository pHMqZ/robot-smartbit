*** Settings ***
Documentation    Cenários de testes de pré-cadastro de clientes

Library    Browser

Resource    ../resources/base.resource

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

Star session
    New Browser    browser=chromium        
    New Page    http://localhost:3000/
    
Notice should be
    [Arguments]     ${target}
    
    Wait For Elements State
    ...    xpath=//div[@class='notice'][contains(.,'${target}')]
    ...    visible    5

*** Test Cases ***
Deve iniciar o cadastro do cliente com sucesso

    ${account}    Get Fake Account
    
    #Preparação para os testes
    Star session

    #Preenchimento de dados
    Submit signup form    ${account}
    

    #Validação de dados
    Wait For Elements State
    ...    //h2[contains(.,'Falta pouco para fazer parte da família Smartbit!')]
    ...    visible    5


Validação de campos obrigatórios - Nome
    [Tags]    required    #tag de campo obrigatório pode auxiliar para rodar
    #teste contendo essa

    ${account}    Create Dictionary
    ...    name=${EMPTY}    
    ...    email=phillipteste@teste.com
    ...    cpf=69652880434


    Star session

    Submit signup form    ${account}
    
    Notice Should be     Por favor informe o seu nome completo


Validação de campos obrigatórios - Email
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=Phillip Marques   
    ...    email=${EMPTY} 
    ...    cpf=69652880434
    
    
    Star session

    Submit signup form    ${account}
    

    Wait For Elements State
    ...    xpath=//div[@class='notice'][contains(.,'Por favor, informe o seu melhor e-mail')]
    ...    visible    5


Validação de campos obrigatórios - CPF
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=Phillip Marques   
    ...    email=phillipteste@teste.com
    ...    cpf=${EMPTY}
    
   
    Star session

    Submit signup form    ${account}

    
    Notice should be    Por favor, informe o seu CPF
   

Preenchimento de email em formato inválido
    [Tags]    invalid 

    ${account}    Create Dictionary
    ...    name=Phillip Marques   
    ...    email=philliptestes
    ...    cpf=69652880434
    
 
    Star session

    Submit signup form    ${account}

    Notice should be    Oops! O email informado é inválido
   

Preenchimento de CPF em formato inválido
    [Tags]    invalid

    ${account}    Create Dictionary
    ...    name=Phillip Marques   
    ...    email=phillipteste@teste.com
    ...    cpf=6965288043as
    

    Star session


   Submit signup form    ${account}

    #Validação de dados
    Notice should be    Oops! O CPF informado é inválido