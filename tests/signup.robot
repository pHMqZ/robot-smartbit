*** Settings ***
Documentation    Cenários de testes de pré-cadastro de clientes


Resource    ../resources/Base.resource

Test Setup       Run Keywords    
...             Start session    AND
...             Set connection
Test Teardown    Run Keywords
...              Close connection    ${DB_CONN}     AND
...              Take Screenshot


*** Test Cases ***
Deve iniciar o cadastro do cliente
    [Tags]    smoke
    
    ${account}    Create Dictionary    
    ...           name=Phillip Marques
    ...           email=phillipteste@teste.com
    ...           cpf=10835805077
    
    Delete user by email    ${DB_CONN}    ${account}[email]
    
    Submit signup form    ${account}
    
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

Select users
    [Arguments]    ${conn}
    Log    Verificando conexão: ${conn}
    ${query}    Set Variable    SELECT * FROM accounts
    Log    Executando consulta SQL: ${query}
    ${result}    Execute Db Operation   ${conn}   ${query}    query
    Log    Resultado: ${result}

Delete user by email
    [Arguments]    ${conn}    ${email}

    ${select_query}    Set Variable    select * from accounts where email = '${email}'
    ${user_exists}    Execute Db Operation    ${conn}    ${select_query}    query

    IF    ${user_exists}
        ${delete_query}    Set Variable    DELETE FROM accounts WHERE email = '${email}'
        ${rows_affected}   Execute DB Operation    ${conn}    ${delete_query}    execute
        
        # Verifica se o delete funcionou
        ${check_query}    Set Variable    SELECT * FROM accounts WHERE email = '${email}'
        ${result}         Execute DB Operation    ${conn}    ${check_query}    query
        
        # Valida o resultado
        IF    ${result} == ${None} or ${result} == @{EMPTY}
            Log    Usuário com email ${email} foi deletado com sucesso
            Return From Keyword    ${True}
        ELSE
            Log    Falha ao deletar usuário com email ${email}
            Return From Keyword    ${False}
        END

    ELSE
        Log    Usuário com email ${email} não encontrado
        Return From Keyword    ${False}
    
    END