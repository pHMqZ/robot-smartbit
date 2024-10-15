*** Settings ***
Documentation    Arquivo principal do projeto Robot

Library        Browser
Library        DatabaseLibrary
Library        libs/Account.py

Resource        database_connection.resource
Resource        pages/Landing.resource
Resource        pages/Welcome.resource
Resource        pages/Login.resource
Resource        pages/Accounts.resource

Resource        pages/components/Toast.resource
Resource        pages/components/BoxNotice.resource


*** Keywords ***
Start session
    New Browser    browser=chromium        
    New Page    http://localhost:3000/

