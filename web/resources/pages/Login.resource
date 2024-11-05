*** Settings ***
Documentation        Ações e elementos da página de Login

Variables      ../Env.py

Library        Browser

*** Keywords ***
Go to login page

    Go to     ${BASE_URL}/login

Submit login form
    [Arguments]    ${email}    ${password}

    Fill Text    //input[contains(@type,'text')]        ${email}
    Fill Text    //input[contains(@type,'password')]    ${password}

    Click        xpath=//button[@type='submit'][contains(.,'Entrar')]

