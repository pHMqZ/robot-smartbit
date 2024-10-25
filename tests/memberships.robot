*** Settings ***
Documentation        Suite de testes de adesões de planos

Resource        ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Realização de nova matricula
    
    ${data}    Get Json fixture    memberships    create
    
        
    Delete User By Email    ${data}[account][email]
    Insert Account    ${data}[account]

    SignIn Admin account     
    
    Go to page           /memberships     Matrículas
    
    Create new memberships    ${data} 

    Toast Should be    Matrícula cadastrada com sucesso.
