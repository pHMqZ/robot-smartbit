*** Settings ***
Library        Browser
Documentation        Verificar Slogan da Landing page da Smartbit

*** Test Cases ***
Deve mostrar Slogan na Landing Page
    #New Browser    browser=chromium     headless=False Comandos para abrir o browser
    # e visualizar os testes acontecendo
    New Page    http://localhost:3000/
    Get Text    //h2[contains(.,'Sua Jornada Fitness Começa aqui!')]
    
    #Sleep    5 Comando para aguardar um periodo de tempo e fechar o browser