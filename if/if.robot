*** Settings ***
Documentation    Teste para IFs - Tomada de Decisões!

*** Variables ***
@{PAISES}    Argentina     Chile    Brasil    Uruguai    Brasil    Chile     Brasil

*** Test Cases ***
Teste de IFs
    Imprimir apenas país Brasil

*** Keywords ***
Imprimir apenas país Brasil
    Log To Console    ${\n}
    FOR    ${pais}    IN    @{PAISES}
        IF    '${pais}' == 'Brasil'
            Log To Console    Opa!! Deu Brasil!
        ELSE
            Log To Console    Ahhh! ${pais} não é Brasil!!          
        END
    END