*** Settings ***
Documentation    Resource com as implementações das KWs da suiteWebTesting
Library          SeleniumLibrary

*** Keywords ***
## ---- SETUP
Abrir o Navegador
    Open Browser    browser=chrome

## ---- TEARDOWN
Fechar o Navegador
    Close Browser    