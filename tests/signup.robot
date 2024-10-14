*** Settings ***
Documentation    Cenários de testes de pré-cadastro de clientes


Resource    ../resources/Base.resource


*** Test Cases ***
Deve iniciar o cadastro do cliente com sucesso

    ${account}    Get Fake Account
    
    #Preparação para os testes
    Star session

    #Preenchimento de dados
    Submit signup form    ${account}
    
    #Validação de dados
    Verify welcome message


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
    

    Notice should be    Por favor, informe o seu melhor e-mail


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
    ...    cpf=69652880tgas
    

    Star session


   Submit signup form    ${account}

    #Validação de dados
    Notice should be    Oops! O CPF informado é inválido