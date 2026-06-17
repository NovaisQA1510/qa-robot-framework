*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Pessoa Todos
    
    # Navegação
    Click    ${mnu_individual} 
    Click    ${mnu_individual_pessoa_todos}
    
    # Validação
    Wait For Elements State    ${individual_pessoa_todos_lbl_individuais_todos}   state=visible
    Wait For Elements State    ${individual_pessoa_todos_btn_buscar}    state=visible

Buscando pelo Nome Pessoa
    [Arguments]    ${nome}=SILVIA BORGES DOMINGOS MAGALHAES

    Fill Text    ${individual_pessoa_todos_txt_campo_nome}    ${nome}
    Click    ${individual_pessoa_todos_btn_buscar}
    Sleep    5s
    ${retorno_nome}   Get Text    xpath=*//table[@class="lista-empresas table table-condensed table-hover table-stripped"]//tbody/tr[1]/td[1]    
    ${retorno_nome}    Strip String    ${retorno_nome}
    
    Should Be Equal    ${nome}     ${retorno_nome}
    

Validação de Pre-preenchimento 
    
    ${valor_txa_vazio}    Get Text    xpath=//*[@id="analise"]
    Should Be Empty    ${valor_txa_vazio}

    Click    ${individual_pessoa_todos_btn_pre_preenchimento}
    Wait For Elements State    ${individual_pessoa_todos_btn_processando}    disabled    timeout=10s
    Wait For Elements State    ${individual_pessoa_todos_btn_pre_preenchimento}    enabled    timeout=20s
    Sleep    2s

    ${valor_txa_preenchido}    Get Text    xpath=//*[@id="analise"]
    Should Not Be Empty    ${valor_txa_preenchido}
    
    Click    ${individual_pessoa_todos_btn_salvar_analise}

    RETURN    ${valor_txa_preenchido}
    
Abrir Modal de Evolução 
    [Arguments]    ${nome}=SILVIA BORGES DOMINGOS MAGALHAES

    Click    ${individual_pessoa_todos_btn_evolucao}

    Wait For Elements State    ${individual_pessoa_todos_lbl_modal_header}     state=visible   
    ${retorno_modal}    Get Text    ${individual_pessoa_todos_lbl_modal_header}
    ${retorno_modal}    Strip String    ${retorno_modal}
    Should Be Equal    ${retorno_modal}    Evolução do Indivíduo - ${nome}
    
Validar Dados Salvos
    [Arguments]    ${valor_txa_preenchido}

    ${valor_salvo}    Get Text      xpath=//*[@id="dialogDiv"]//table//tr[1]/td[@class="historico-info"]//*[@class="form-control analise-area"]
    Should Not Be Empty    ${valor_salvo}

    Should Be Equal    ${valor_salvo}    ${valor_txa_preenchido}

Exclusão de Dados
    
    Click    xpath=//*[@id="dialogDiv"]//table//tr[1]/td//button[@title="Remover"]
    Sleep    1s
    Keyboard Key    press    Enter
    