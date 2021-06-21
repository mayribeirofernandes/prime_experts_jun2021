*** Settings ***
Documentation    Resource com as implementações das KWs da suiteWebTesting
Library          SeleniumLibrary   timeout=8
Library          String


*** Variables ***
${URL}                 http://automationpractice.com
&{PESSOA}              nome=Fulano    sobrenome=De Tal    pwd=123456
...                    endereco=Rua Framework, Bairro Robot    cidade=Sampa
...                    id_estado=9  cep=12345  telefone=99988877
@{PRODUTOS_CATEGORIA}  Printed Summer Dress  Printed Chiffon Dress


*** Keywords ***
## ---- SETUP
Abrir o Navegador
    Open Browser    browser=headlesschrome

## ---- TEARDOWN
Fechar o Navegador
    Close Browser    

## ---- STEPS
Verificar se o site está OK
    [Documentation]       Vou verificar se o site está no ar ou com problemas técnicos
    ${FORA_DO_AR}         Run Keyword And Return Status
    ...                   Wait Until Page Contains   Resource Limit Is Reached
    ${TECHNICAL_ERROR}    Run Keyword And Return Status
    ...                   Wait Until Page Contains   TECHNICAL ERROR

    IF  ${FORA_DO_AR} or ${TECHNICAL_ERROR}
        Capture Page Screenshot
        Fail  msg=-----> O site está fora do ar ou com problemas técnicos! Tente novamente mais tarde!
    END

Acessar a página home do site Automation Practice
    Go To    ${URL}
    Verificar se o site está OK
    Wait Until Element Is Visible    xpath=//img[contains(@class,'logo img-responsive')]

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text    id=search_query_top    ${PRODUTO}
    
Clicar no botão pesquisar
    Click Button    name=submit_search
    Verificar se o site está OK

Adicionar o produto "${PRODUTO}" no carrinho
    Mouse Over       xpath=(//a[@class='product-name'][contains(.,'${PRODUTO}')])[2]
    Click Element    xpath=//span[contains(.,'Add to cart')]
    Wait Until Element Is Visible    xpath=//span[contains(.,'Proceed to checkout')]
    Click Element    xpath=//span[contains(.,'Proceed to checkout')]

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Wait Until Element Is Visible   xpath=//*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]
    Mouse Over                      xpath=//*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]

Clicar na sub categoria "${SUBCATEGORIA}"
    Wait Until Element Is Visible   xpath=//*[@id="block_top_menu"]//a[@title="${SUBCATEGORIA}"]
    Click Element                   xpath=//*[@id="block_top_menu"]//a[@title="${SUBCATEGORIA}"]

Clicar em "Sign in"
    Click Element    xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]
    Verificar se o site está OK

Informar um e-mail válido
    Wait Until Element Is Visible   id=email_create
    # Uso a Library String para gerar uma palavra aleatória e usar como e-mail
    ${EMAIL}                        Generate Random String
    Input Text                      id=email_create    ${EMAIL}@testerobot.com

Clicar em "Create an account"
    Click Button    id=SubmitCreate
    Verificar se o site está OK

Preencher os dados obrigatórios
    Wait Until Element Is Visible   xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
    Click Element                   id=id_gender2
    Input Text                      id=customer_firstname    ${PESSOA.nome}
    Input Text                      id=customer_lastname     ${PESSOA.sobrenome}
    Input Text                      id=passwd                ${PESSOA.pwd}
    Input Text                      id=address1              ${PESSOA.endereco}
    Input Text                      id=city                  ${PESSOA.cidade}
    Set Focus To Element            id=id_state
    Select From List By Index       id=id_state              ${PESSOA.id_estado}
    Input Text                      id=postcode              ${PESSOA.cep}
    Input Text                      id=phone_mobile          ${PESSOA.telefone}

Submeter cadastro
    Click Button    submitAccount
    Verificar se o site está OK

#### Conferências
Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible    xpath=//img[contains(@alt,'${PRODUTO}')]

Conferir mensagem "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be          xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}

Conferir se o produto "${PRODUTO}" foi adicionado no carrinho
    Wait Until Element Is Visible    xpath=(//a[contains(.,'${PRODUTO}')])[4]

Conferir se os produtos da sub-categoria "${SUBCATEGORIA}" foram mostrados na página
    Page Should Contain Element    xpath=//*[@id="center_column"]/h1/span[contains(text(),"${SUBCATEGORIA}")]
    Page Should Contain Element    xpath=//*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a[@title="${PRODUTOS_CATEGORIA[0]}"]
    Page Should Contain Element    xpath=//*[@id="center_column"]/ul/li[2]/div/div[2]/h5/a[@title="${PRODUTOS_CATEGORIA[0]}"]
    Page Should Contain Element    xpath=//*[@id="center_column"]/ul/li[3]/div/div[2]/h5/a[@title="${PRODUTOS_CATEGORIA[1]}"]

Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p
    Element Text Should Be           xpath=//*[@id="center_column"]/p
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be           xpath=//*[@id="header"]/div[2]//div[1]/a/span    ${PESSOA.nome} ${PESSOA.sobrenome}
