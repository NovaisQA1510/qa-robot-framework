*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Configuração
    
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_configuracao_configuracao}
    
    # Validação
    Wait For Elements State    ${config_config_lbl_parametros}   state=visible
    Wait For Elements State    ${erro_CDbException}    state=detached
    Wait For Elements State    ${erro_php_traces}    state=detached



Configurar empresa
    [Arguments]    ${empresa} 

 # Verificar se o botão já está ativo
    ${is_active}=    Get Element Count    xpath=//*[@id="content"]//li[@class="active"]//*[contains(text(),"Relatórios de Saúde")]
    IF    ${is_active} == 0
        Click    ${config_config_btn_relatorio_saude}
        Log    Botão clicado para ativar Relatórios de Saude.
    ELSE
        Log    Botão de Relatórios de Saude já está ativo.
    END
    
     Wait For Elements State    ${config_config_lbl_layout}    state=visible

    Limpar Configuração de empresa  

    # Selecionar empresa
    ${empresa_text}    Get Text    ${config_config_ddl_empresa} 
    IF    "${empresa_text.strip()}" == "${empresa.empresa}"
        Log    Empresa já selecionada - "${empresa_text.strip()}"
    ELSE
        Click    ${config_config_ddl_empresa} 
        Click    xpath=*//form[@id="form-config-saude"]//select[@id="id_empresa"]/..//ul[@class="multiselect-container dropdown-menu"]//label[text()[normalize-space() = '${empresa.empresa}']]
        Sleep    2s
    END
    
    # Selecionar Operadora/Seguradora
    IF    "${empresa.operadora}" != "None"
        ${operadora_text}    Get Text    ${config_config_ddl_operadora}
        IF    "${operadora_text.strip()}" == "${empresa.operadora}"
            Log    Operadora/Seguradora já selecionada - "${operadora_text.strip()}"
        ELSE
            Click    ${config_config_ddl_operadora}
            Check Checkbox    css=input[value="${empresa.operadora}"]
            Sleep    1s
            Click    ${config_config_ddl_operadora}    
        END
    END
    
    # Selecionar Agrupamento
    IF   "${empresa.agrupamento}" != "None"
        ${agrupamento_text}    Get Text    ${config_config_ddl_agrupamento}
        IF    "${agrupamento_text.strip()}" == "${empresa.agrupamento}"
            Log    Agrupamento já selecionada - "${agrupamento_text.strip()}"
        ELSE
            Click    ${config_config_ddl_agrupamento}
            Click    xpath=*//label[text()[normalize-space() = '${empresa.agrupamento}']]
            Sleep    1s
            Click    ${config_config_ddl_agrupamento}   
        END 
    END

    # Subestipulante
    IF    "${empresa.subestipulante}" == "todos"
        Log    Selecionando todos
    ELSE
        Click    ${config_config_ddl_subestipulante}
        Click    xpath=*//ul[@class="multiselect-container dropdown-menu"]//label[text()[normalize-space() = '${empresa.subestipulante}']]
        Sleep    1s
        Click    ${config_config_ddl_subestipulante}
    END

    # Período para análise
    Click    xpath=*//form[@id="form-config-saude"]//select[@id="periodo_ini"]
    Select Options By    xpath=*//form[@id="form-config-saude"]//select[@id="periodo_ini"]    value    ${empresa.periodo_inicio}

    Click    xpath=*//form[@id="form-config-saude"]//select[@id="periodo_fim"]
    Select Options By    xpath=*//form[@id="form-config-saude"]//select[@id="periodo_fim"]    value    ${empresa.periodo_fim}
    
    
    #Submit
    Click    ${config_config_btn_salvar}
    Wait For Elements State    text=Configurações salvas com sucesso.    state=visible
    Click    ${config_config_btn_feechar} 

Validar empresa configurada
    [Arguments]    ${empresa}
    
    Sleep    5s

    # Valida Empresa
    ${empresa_text}    Get Text    ${config_config_lbl_info_estipulante}    
    Should Be Equal    ${empresa_text.strip()}    ${empresa.empresa}
    
    # Valida seguradora
    ${seguradora_text}    Get Text    ${config_config_lbl_info_seguradora}
    IF    "${empresa.operadora}" == "None"
        Should Be Equal    ${seguradora_text.strip()}    Nenhuma seguradora selecionada
    ELSE
        Should Be Equal    ${seguradora_text.strip()}    ${empresa.operadora}
    END

    # Valida Período
    ${periodo_text}    Get Text    ${config_config_lbl_info_periodo}
    Should Be Equal    ${periodo_text}    ${empresa.periodo_inicio} a ${empresa.periodo_fim}
    
    # Valida tipo de dado
    Wait For Elements State    ${config_config_lbl_tipo_dado}   state=visible

Limpar Configuração de empresa

    ${empresa_text}    Get Text    ${config_config_ddl_empresa} 
    IF    "${empresa_text.strip()}" == "Vibe"
        Log    Empresa já selecionada - "${empresa_text.strip()}"
    ELSE
        Click    ${config_config_ddl_empresa} 
        Click    xpath=*//ul[@class="multiselect-container dropdown-menu"]//label[text()[normalize-space() = 'Vibe']]
        Sleep    2s
    END

Validação de Empresa Existente em: Configuração - Configuração
    [Arguments]    ${status}    ${empresa}

    Click    ${config_config_btn_relatorio_saude}
    Click     ${config_config_ddl_empresa}

    ${retorno}       Run Keyword And Return Status    Get Element    xpath=*//ul[@class="multiselect-container dropdown-menu"]//label[text()[normalize-space() = '${empresa.empresa}']]

    IF    "${status}" == "True"
        Should Be True    ${retorno}
        Log To Console    \n${empresa.empresa} existe - VALIDADO COM SUCESSO (Configuração - Configuração)
    ELSE 
        Should Not Be True    ${retorno}
        Log To Console    \n${empresa.empresa} não existe - VALIDADO COM SUCESSO (Configuração - Configuração)
    END