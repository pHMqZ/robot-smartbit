*** Settings ***
Documentation        Suite de testes da funcionalidade de cadastro de medidas no aplicativo Android

Resource             ../resources/Base.resource

Test Setup          Star session
Test Teardown       Finish session

*** Test Cases ***
Cadastro de medidas
    ${data}    Get Json fixture    update
    Insert Membership    ${data}

    Signin with document    ${data}[account][cpf]
    User is logged in

    Touch My body

    Weight and height registration    ${data}[account]

    Popup have text    Seu cadastro foi atualizado com sucesso