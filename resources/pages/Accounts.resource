*** Settings ***
Documentation        Ações e elementos da página de clientes

Library    Browser


*** Keywords ***
Successful login
    
    [Arguments]    ${email}
    
    Wait For Elements State    //span[@class='logged-user'][contains(.,'${email}')]
    ...    visible    5 