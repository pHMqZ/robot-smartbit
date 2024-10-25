*** Settings ***
Documentation        Ações e elementos da barra de navegação

Library              Browser


*** Keywords ***
Go to page
    [Arguments]    ${link}    ${validation}
    Click                //a[@href='${link}'] 

    Wait For Elements State    //h1[contains(.,'${validation}')]    
    ...    visible    5
     
Successful login
    
    [Arguments]    ${email}
    
    Wait For Elements State    //span[@class='logged-user'][contains(.,'${email}')]
    ...    visible    5 
