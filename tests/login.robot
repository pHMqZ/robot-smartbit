*** Settings ***
Documentation        Cenários de testes do Login SAC

Resource         ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Login como gestor de academia
    
    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    Successful login     sac@smartbit.com

Tentativa de login com senha incorreta
    [Tags]     invalid_password

    Go to login page
    Submit login form    sac@smartbit.com    ade132

    Sleep    3
    
    Toast Should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Tentativa de login com email incorreto
    [Tags]     invalid_email

    Go to login page
    Submit login form    123@smartbit.com    pwd132

    Sleep    3
    
    Toast Should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!

Tentativa de login com dados incorretos
    [Template]   Login attempt with incorrect fields
    ${EMPTY}            ${EMPTY}     Os campos email e senha são obrigatórios.
    ${EMPTY}            pwd123       Os campos email e senha são obrigatórios.
    sac@smartbit.com    ${EMPTY}     Os campos email e senha são obrigatórios.
    testeteste          pwd123       Oops! O email informado é inválido
    www.teste.com       pwd123       Oops! O email informado é inválido
    QWIE123             pwd123       Oops! O email informado é inválido
    $##$$$q             pwd123       Oops! O email informado é inválido


*** Keywords ***
Login attempt with incorrect fields
    [Arguments]        ${email}        ${password}        ${output_message}

    Go to login page
    Submit login form    ${email}    ${password}
    Notice should be     ${output_message}
