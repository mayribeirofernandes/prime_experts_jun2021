*** Settings ***
Documentation    Suíte de Testes WEB - Site: http://automationpractice.com
Resource         resourceWebTesting.robot
Suite Setup      Abrir o Navegador
Suite Teardown   Fechar o Navegador

*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente e adicioná-lo no carrinho
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site
    Adicionar o produto "Blouse" no carrinho
    Conferir se o produto "Blouse" foi adicionado no carrinho