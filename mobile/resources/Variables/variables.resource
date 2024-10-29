*** Settings ***
Documentation        Arquivo para criação de variaveis de ambiente

*** Variables ***

# Capabilites do android
${appURL}            http://localhost:4723
${platformName}      Android
${automationName}    UIAutomator2
${deviceName}        Emulator    
${udid}              emulator-5554
${app}               ${EXECDIR}/app/smartbit-beta.apk

# API
${ipAPI}             26.221.86.130