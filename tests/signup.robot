*** Settings ***
Documentation    Cenários de testes de pré-cadastro de clientes


Resource    ../resources/Base.resource

Test Setup        Start session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente com sucesso

    ${account}    Get Fake Account
    

    #Preenchimento de dados
    Submit signup form    ${account}
    
    #Validação de dados
    Verify welcome message


Tentativa de pré-cadastro
    [Template]        Attempted signup
    ${EMPTY}           phillipteste@teste.com    69652880434    Por favor informe o seu nome completo
    Phillip Marques    ${EMPTY}                  69652880434    Por favor, informe o seu melhor e-mail
    Phillip Marques    phillipteste@teste.com    ${EMPTY}       Por favor, informe o seu CPF
    Phillip Marques    philliptestes             69652880434    Oops! O email informado é inválido
    Phillip Marques    phillip!testes.com        69652880434    Oops! O email informado é inválido
    Phillip Marques    www.philliptestes.com     69652880434    Oops! O email informado é inválido
    Phillip Marques    123143                    69652880434    Oops! O email informado é inválido
    Phillip Marques    iojsd@#$@ksdjfl           69652880434    Oops! O email informado é inválido
    Phillip Marques    phillipteste@teste.com    69652880tgas   Oops! O CPF informado é inválido
    Phillip Marques    phillipteste@teste.com    dssdfsdfsdfd   Oops! O CPF informado é inválido
    Phillip Marques    phillipteste@teste.com    696328!@tgas   Oops! O CPF informado é inválido
    Phillip Marques    phillipteste@teste.com    69652880421    Oops! O CPF informado é inválido
    Phillip Marques    phillipteste@teste.com    12             Oops! O CPF informado é inválido

*** Keywords ***
Attempted signup
    [Arguments]     ${name}    ${email}    ${cpf}    ${output_message}

    ${account}    Create Dictionary
    ...    name=${name}  
    ...    email=${email}
    ...    cpf=${cpf}
 
   Submit signup form    ${account}

    #Validação de dados
    Notice should be     ${output_message}