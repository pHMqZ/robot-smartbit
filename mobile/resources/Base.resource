*** Settings ***
Documentation        Arquivo principal do projeto de testes automatizados para mobile

Library              AppiumLibrary
Library              JSONLibrary

Library            ../../libs/Database_conn.py
Library    OperatingSystem

Resource             ../../services/Service.resource
Resource             Variables/variables.resource
Resource             Actions/account.resource
Resource             Actions/body.resource
Resource             Actions/login.resource
Resource             Actions/Components/menu.resource
Resource             Actions/Components/popup.resource



*** Keywords ***
Star session
    
    Open Application    ${appURL}   
    ...    platformName=${platformName}
    ...    automationName=${automationName}    
    ...    deviceName=${deviceName}    
    ...    udid=${udid}    
    ...    app=${app}
    ...    autoGrantPermissions=true
    

    Wait Until Page Contains    IP da API    30

Finish session

    Capture Page Screenshot
    Close Application

Get Json fixture
    
    [Arguments]    ${scenario}  

    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/data.json
    ...    encoding=utf-8
    
    RETURN    ${data}[${scenario}]