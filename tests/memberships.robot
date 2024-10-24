*** Settings ***
Documentation        Suite de testes de adesões de planos

Resource        ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Realização de nova matricula
    
    ${account}    Create Dictionary
    ...           name=Alceu Silva
    ...           email=alceu.silva@teste.com.br
    ...           cpf=87181025066
    
    ${plan}       Set Variable     Plano Black
    
    ${credit_card}    Create Dictionary
    ...               number=5105105105105100
    ...               name=${account}[name]
    ...               month=09
    ...               year=2032
    ...               cvv=123
    Delete User By Email    ${account}[email]
    
    Insert Account    ${account}

    Go to login page
    Submit login form       sac@smartbit.com    pwd123
    Successful login        sac@smartbit.com
    
    Go to Memberships           /memberships     Matrículas
    
    Go to Memberships           /memberships/new    Nova matrícula    
    
    Select Account          ${account}[name]    ${account}[cpf]    

    Select plan             ${plan}

    Fill payment details    ${credit_card}
       

    Click     //button[@type='submit'] 



    Toast Should be    Matrícula cadastrada com sucesso.


*** Keywords ***
Go to Memberships
    [Arguments]    ${link}    ${validation}
    Click                //a[@href='${link}'] 

    Wait For Elements State    //h1[contains(.,'${validation}')]    
    ...    visible    5

Select Account
    [Arguments]    ${name}    ${cpf}

    Fill Text    //input[contains(@aria-label,'select_account')]   ${name}

    Click        //div[@data-testid="${cpf}"]

Select plan
    [Arguments]     ${plan_name}

    Fill Text    //input[contains(@aria-label,'select_plan')]    ${plan_name}

    Click        //div[contains(@id, 'option')]

Fill payment details
    [Arguments]    ${credit_card}

    Fill Text    //input[@placeholder='Número do cartão de crédito']         ${credit_card}[number]
    Fill Text    //input[@placeholder='Digite o nome impresso no cartão']    ${credit_card}[name]
    Fill Text    //input[@placeholder='MM']                                  ${credit_card}[month]
    Fill Text    //input[@placeholder='AAAA']                                ${credit_card}[year]
    Fill Text    //input[@placeholder='CVV']                                 ${credit_card}[cvv]