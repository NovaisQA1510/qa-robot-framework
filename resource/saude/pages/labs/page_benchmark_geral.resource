*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Labs Benchmark Geral
    # Navegação
    Click    ${mnu_labs}
    Click    ${mnu_labs_benchmark_geral} 
    
    # Validação
    Wait For Elements State    ${labs_benchmark_geral_lbl_dados_benchmark}           state=visible
    Wait For Elements State    ${labs_benchmark_geral_btn_filtrar}                   state=visible

Validação de Empresa Existente em: Labs - Benchmark Geral
    [Arguments]    ${status}    ${empresa}

    Click    ${labs_benchmark_geral_ddl_selecionar_empresa}
      
    IF    "${status}" == "True"
        ${retorno}       Run Keyword And Return Status    Get Elements    xpath=*//ul[@class="multiselect-container dropdown-menu"]//label[contains(text(),'${empresa.empresa}')]
        Should Be True    ${retorno}
        Log To Console    \n${empresa.empresa} existe - VALIDADO COM SUCESSO (Labs - Benchmark Geral)
    ELSE
        ${retorno}       Run Keyword And Return Status    Get Element    xpath=*//ul[@class="multiselect-container dropdown-menu"]//label[contains(text(),'${empresa.empresa}')]
        Should Not Be True    ${retorno}
        Log To Console    \n${empresa.empresa} não existe - VALIDADO COM SUCESSO (Labs - Benchmark Geral)
    END