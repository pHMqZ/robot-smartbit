*** Settings ***
Documentation        Ações e elementos do componente Toast

Library        Browser

*** Keywords ***
Toast Should be
    [Arguments]        ${expected_text}

    ${selector}        Set Variable    .Toastify__toast-body

    Wait For Elements State    
    ...    xpath=//div[@class='Toastify__toast-body'][contains(.,'${expected_text}')]
    ...    visible    5
    
    Get Text    css=${selector}
    ...    equal
    ...    ${expected_text}
    
    Take Screenshot   selector=${selector}
