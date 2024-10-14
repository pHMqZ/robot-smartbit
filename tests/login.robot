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


