*** Settings ***
Documentation        Arquivo de testes de consumo da api com tasks

Resource             ./Service.resource

*** Tasks ***
Testando API
    
    Set user token
    Get account by name    Elis Marques