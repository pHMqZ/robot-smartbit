*** Settings ***
Documentation        Ações e elementos da caixa de notificação

Library        Browser

*** Keywords ***
Notice should be
    [Arguments]     ${target}
    
    Wait For Elements State
    ...    xpath=//div[@class='notice'][contains(.,'${target}')]
    ...    visible    5
