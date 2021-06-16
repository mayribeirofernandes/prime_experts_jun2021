*** Settings ***
Documentation    Testes para criar KWs que recebem argumentos e retornam um resultado

Suite Setup        KW para executar no Setup da Suite
Test Setup         KW para executar no Setup de cada Teste
Suite Teardown     KW para executar no Teardown da Suíte
Test Teardown      KW para executar no Teardown de cada Teste

*** Test Cases ***
Teste de somar dois números
    ${RESULTADO_SOMA}    Somar dois números    1    2
    Log To Console    O resultado da soma é: ${RESULTADO_SOMA}
    ${RESULTADO_SOMA}    Somar dois números    3    4
    Log To Console    O resultado da soma é: ${RESULTADO_SOMA}

Teste de somar dois números embutidos
    ${RESULTADO_SOMA}    Somar os números "3" e "6"
    Log To Console    O resultado da soma embutida é: ${RESULTADO_SOMA}
    ${RESULTADO_SOMA}    Somar os números "55" e "45"
    Log To Console    O resultado da soma embutida é: ${RESULTADO_SOMA}    

*** Keywords ***
KW para executar no Setup da Suite
    Log To Console    Essa Kw foi executada antes de começar a Suíte!

KW para executar no Setup de cada Teste
    Log To Console    Essa Kw foi executada antes de começar esse Teste!

KW para executar no Teardown da Suíte      
    Log To Console    Essa Kw foi executada ao final da Suíte!

KW para executar no Teardown de cada Teste
    Log To Console    Essa Kw foi executada ao final desse Teste!

Somar dois números
    [Arguments]    ${NUM_A}    ${NUM_B}
    Log To Console    ${\n}Estou somando os números: ${NUM_A}+${NUM_B}
    ${RESULTADO}   Evaluate    ${NUM_A}+${NUM_B}
    Log To Console    O resultado é: ${RESULTADO}
    [Return]    ${RESULTADO}

Somar os números "${NUM_A}" e "${NUM_B}"
    Log To Console    ${\n}Estou somando os números embutidos: ${NUM_A}+${NUM_B}
    ${RESULTADO}   Evaluate    ${NUM_A}+${NUM_B}
    [Return]    ${RESULTADO}