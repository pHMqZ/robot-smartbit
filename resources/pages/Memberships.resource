*** Settings ***
Documentation        Ações e elementos da página de matrícula

Library              Browser


*** Keywords ***
Create new memberships
    
    [Arguments]    ${data}

    Go to memberships form           /memberships/new    Nova matrícula    
    
    Select Account          ${data}[account][name]    ${data}[account][cpf]    
    Select plan             ${data}[plan][name]
    Fill payment details    ${data}[credit_card]

    Click     //button[@type='submit'] 
    
Go to memberships form
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

Search by name
    [Arguments]    ${name}

    Fill Text    //input[@placeholder='Busque por nome']    ${name}
    
    Wait For Elements State    //strong[contains(.,'Total: 1')]
    ...    visible    5

    Wait For Elements State    //tr[contains(.,'${name}')]
    ...    visible    5

