*** Settings ***
Documentation        Arquivo para conexão ao banco de dados


Library        ../libs/Database_conn.py

*** Variables ***
${DB_CONN}    ${None}

*** Keywords ***
Set connection
    Log    Tentando conectar ao banco
    ${conn}    Set connection DB
    Check Connection    ${conn}
    Set Test Variable    ${DB_CONN}    ${conn}
    Log    Conexão ok Resource 

Close connection
    [Arguments]    ${conn}
    Log    	Fechando conexão
    Close connection DB    ${conn}
    Log    Conexão encerrada