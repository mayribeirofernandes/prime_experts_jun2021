*** Settings ***
Documentation    Exercício IF

*** Test Cases ***
Teste de imprimir apenas alguns números
    Imprimir somente se for 5 e 8

*** Keywords ***
Imprimir somente se for 5 e 8
    Log To Console    ${\n}
    FOR    ${numero}    IN RANGE    0    11
        # IF  ${numero} == 5 or ${numero} == 8
        IF  ${numero} in (5,8)
            Log To Console    Estou no número: ${numero}           
        END              
    END
