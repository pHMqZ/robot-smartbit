*** Settings ***
Documentation        Ações e elementos do componente Toast

Library        Browser

*** Keywords ***
Toast Should be
    [Arguments]        ${expected_text}

    Wait For Elements State    xpath=//div[@class='Toastify__toast-body'][contains(.,'${expected_text}')]
    ...    visible    5