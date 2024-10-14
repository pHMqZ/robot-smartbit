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

