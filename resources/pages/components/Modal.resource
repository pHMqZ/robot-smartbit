*** Settings ***
Documentation        Ações e elementos do modal de confirmação

Library              Browser

*** Keywords ***
Confirm remove
    Click           xpath=//button[@class='swal2-confirm swal2-styled']