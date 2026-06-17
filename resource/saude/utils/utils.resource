*** Keywords ***
Valor é maior que valor limite
    [Arguments]    ${valor_1}    ${valor_2}
    
    ${valor_1_int}    Convert To Integer    ${valor_1}
    ${valor_2_int}    Convert To Integer    ${valor_2}

    IF    ${valor_1_int} >= ${valor_2_int}
        Log    Maior
        ${resultado}    Set Variable    ${True}   
    ELSE
        Log    Menor
        ${resultado}    Set Variable    ${False}     
    END

    RETURN    ${resultado}