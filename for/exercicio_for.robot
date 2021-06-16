*** Settings ***
Documentation    Exercícios de FOR

*** Variables ***
@{PAISES}    Brasil    Argentina     Chile     Uruguai    Bolívia

*** Test Cases ***
Teste de contar
    Imprimir intervalo   0    10
    Imprimir intervalo   20   25

Teste de imprimir a lista de países
    Imprimir uma lista

*** Keywords ***
Imprimir intervalo
    [Arguments]   ${A}   ${B}
    FOR    ${counter}    IN RANGE    ${A}    ${B}+1
        Log To Console   Estou no número: ${counter}
    END

Imprimir uma lista
    FOR    ${pais}    IN    @{PAISES}
        Log To Console  País: ${pais}        
    END    