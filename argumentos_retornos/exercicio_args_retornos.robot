*** Settings ***
Documentation    Exercício de argumentos e retornos

*** Variables ***
&{DADOS}    nome=may    sobrenome=fernandes    idade=15

*** Test Cases ***
Testar a criação de e-mails
    ${e-mail}    Criar e-mail    ${DADOS.nome}    ${DADOS.sobrenome}    ${DADOS.idade}
    Log To Console    ${\n}O e-mail formado é: ${e-mail}

*** Keywords ***
Criar e-mail
    [Arguments]    ${nome}    ${sobrenome}    ${idade}
    [Return]    ${nome}_${sobrenome}_${idade}@robot.com
