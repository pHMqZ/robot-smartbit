*** Settings ***
Documentation    Arquivo principal do projeto Robot

Library        JSONLibrary

Library        Browser
Library        DatabaseLibrary
Library        ../../libs/Account.py

Resource        database/database_connection.resource
Resource        pages/Landing.resource
Resource        pages/Welcome.resource
Resource        pages/Login.resource
Resource        pages/Accounts.resource
Resource        pages/Memberships.resource

Resource        pages/components/Toast.resource
Resource        pages/components/BoxNotice.resource
Resource        pages/components/NavBar.resource
Resource        pages/components/Modal.resource

*** Variables ***
${ADMIN_EMAIL}    sac@smartbit.com
${ADMIN_PASS}     pwd123


*** Keywords ***
Start session
    New Browser    browser=chromium        
    New Page    http://localhost:3000/

#Helpers
Get Json fixture
    
    [Arguments]       ${file_name}    ${scenario}

    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8
    
    RETURN    ${data}[${scenario}]
SignIn Admin account 

    Go to login page
    Submit login form       ${ADMIN_EMAIL}    ${ADMIN_PASS}
    Successful login        ${ADMIN_EMAIL}
    