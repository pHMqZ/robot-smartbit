*** Settings ***
Documentation        Ações e elementos da página de Login

Library        Browser

*** Keywords ***
Go to login page

    Go to     localhost:3000/login

Submit login form
    [Arguments]    ${email}    ${password}

    Fill Text    //input[contains(@type,'text')]        ${email}
    Fill Text    //input[contains(@type,'password')]    ${password}

    Click        xpath=//button[@type='submit'][contains(.,'Entrar')]

Toast Should be
    [Arguments]        ${expected_text}

    Wait For Elements State    xpath=//div[@class='Toastify__toast-body'][contains(.,'${expected_text}')]
    ...    visible    5