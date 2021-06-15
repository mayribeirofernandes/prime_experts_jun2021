*** Settings ***
Documentation    Teste do Exercício de Variáveis

*** Variables ***
&{PESSOA}    nome=May    sobrenome=Fernandes    idade=15
...          sexo=Feminino    profissao=QA    mãe=Shirley
@{FRUTAS}    banana    maça    morango    abacaxi    mamão

*** Test Cases ***
Teste que imprime os dados da PESSOA
    Imprimir no console os dados da PESSOA

Teste que imprime todas as 5 frutas
    Imprimir no console as frutas

*** Keywords ***
Imprimir no console os dados da PESSOA
    Log To Console    ${\n}
    Log To Console    Nome: ${PESSOA.nome}
    Log To Console    Sobrenome: ${PESSOA.sobrenome}
    Log To Console    Idade: ${PESSOA.idade}
    Log To Console    Sexo: ${PESSOA.sexo}
    Log To Console    Profissão: ${PESSOA.profissao}                
    Log To Console    Mãe: ${PESSOA.mãe}       

Imprimir no console as frutas
    Log To Console    ${\n}
    Log To Console    Fruta 0: ${FRUTAS}[0]              
    Log To Console    Fruta 1: ${FRUTAS}[1]
    Log To Console    Fruta 2: ${FRUTAS}[2]
    Log To Console    Fruta 3: ${FRUTAS}[3]
    Log To Console    Fruta 4: ${FRUTAS}[4]