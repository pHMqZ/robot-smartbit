*** Settings ***
Documentation        Ações e elementos do componente menu de navegação


Library              AppiumLibrary


*** Keywords ***
Touch My body

    Click Element    xpath=//android.widget.TextView[@text="Meu corpo"]

Touch My account

    Click Element    xpath=//android.widget.TextView[@text="Minha conta"]