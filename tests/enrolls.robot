*** Settings ***
Documentation        Suite de testes de adesões de planos

Resource        ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Realização de nova matricula

    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    Successful login     sac@smartbit.com
    
    Go to Enrolls        /memberships     Matrículas
    
    Go to Enrolls     /memberships/new    Nova matrícula    
    
    Select Account    Phillip Marques    10835805077

    Select plan    Smart

    Fill payment details    5105105105105100
    ...    Phillip Marques    09    2032    123

    Click     //button[@type='submit'] 

    

    Toast Should be    Matrícula cadastrada com sucesso.


*** Keywords ***
Go to Enrolls
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
    [Arguments]    ${cardNumber}    ${cardName}    ${month}    ${year}    ${cvv}

    Fill Text    //input[@placeholder='Número do cartão de crédito']         ${cardNumber}
    Fill Text    //input[@placeholder='Digite o nome impresso no cartão']    ${cardName}
    Fill Text    //input[@placeholder='MM']                                  ${month}
    Fill Text    //input[@placeholder='AAAA']                                ${year}
    Fill Text    //input[@placeholder='CVV']                                 ${cvv}