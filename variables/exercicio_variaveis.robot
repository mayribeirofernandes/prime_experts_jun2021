*** Settings ***
Documentation    Teste do Exercício de Variáveis

*** Variables ***
&{PESSOA}    nome=May    sobrenome=Fernandes    idade=15
...          sexo=Feminino    profissao=QA    mãe=Shirley

*** Test Cases ***
Teste que imprime os dados da PESSOA
    Imprimir no console os dados da PESSOA

*** Keywords ***
Imprimir no console os dados da PESSOA
    Log To Console    ${\n}
    Log To Console    Nome: ${PESSOA.nome}
    Log To Console    Sobrenome: ${PESSOA.sobrenome}
    Log To Console    Idade: ${PESSOA.idade}
    Log To Console    Sexo: ${PESSOA.sexo}
    Log To Console    Profissão: ${PESSOA.profissao}                
    Log To Console    Mãe: ${PESSOA.mãe}                