*** Settings ***
Documentation        Arquivo principal do projeto de testes automatizados para mobile

Library              AppiumLibrary

Resource             Variables/variables.resource

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