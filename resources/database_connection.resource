*** Settings ***
Documentation        Tentativa de conexão ao banco


Library        libs/Database_conn.py

*** Variables ***
${DB_CONN}    None

*** Keywords ***
Set connection
    ${DB_CONN}=    Set connection
    RETURN         ${DB_CONN}

Close connection
    [Arguments]    ${conn}
    Evaluate    Close connection(${conn})