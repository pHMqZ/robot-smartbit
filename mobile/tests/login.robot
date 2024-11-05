*** Settings ***
Documentation        Suite de testes de login no app

Resource            ../resources/Base.resource

Test Setup          Star session
Test Teardown       Finish session


*** Test Cases ***
Login válido
    ${data}    Get Json fixture    login

    Insert Membership    ${data}

    Signin with document        ${data}[account][cpf]

    User is logged in

Login com CPF não cadastrado
    [Tags]    temp
    
    Login attempt with incorrect CPF    27024373032    Acesso não autorizado! Entre em contato com a central de atendimento
    
Login com CPF em branco
    Login attempt with incorrect CPF    ${EMPTY}    Informe o número do seu CPF
    
Login com CPF inexistente
    Login attempt with incorrect CPF    27024373031   CPF inválido, tente novamente

