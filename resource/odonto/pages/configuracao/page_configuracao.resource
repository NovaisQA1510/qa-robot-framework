*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Configuração
    
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_configuracao_configuracao}
    
    # Validação
    Wait For Elements State    ${config_config_lbl_parametros}   state=visible

Configurar empresa
    [Arguments]    ${empresa} 

    # Verificar se o botão já está ativo
    ${is_active}=    Get Element Count    xpath=//*[@id="content"]//li[@class="active"]//*[contains(text(),"Relatórios de Odonto")]
    IF    ${is_active} == 0
        Click    ${config_config_btn_relatorios_odonto}
        Log    Botão clicado para ativar Relatórios de Odonto.
    ELSE
        Log    Botão de Relatórios de Odonto já está ativo.
    END

    Limpar Configuração de empresa  
    
    # Selecionar empresa
    ${empresa_text}    Get Text    ${config_config_ddl_empresa} 
    IF    "${empresa_text.strip()}" == "${empresa.empresa}"
        Log    Empresa já selecionada - "${empresa_text.strip()}"
    ELSE
        Click    ${config_config_ddl_empresa} 
        Click    xpath=//div[@id="tab-config-odonto"]//ul[@class="multiselect-container dropdown-menu"]//label[text()[normalize-space() = '${empresa.empresa}']]
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
    Click    ${config_config_lbl_info_periodo_inicio}
    Select Options By    ${config_config_lbl_info_periodo_inicio}    value    ${empresa.periodo_inicio}

    Click    ${config_config_lbl_info_periodo_fim}
    Select Options By    ${config_config_lbl_info_periodo_fim}    value    ${empresa.periodo_fim}

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
   
    #Validar Tipo de Dados
    Wait For Elements State    ${config_config_lbl_tipo_dado_odonto}   state=visible 
    
Limpar Configuração de empresa
    ${empresa_text}    Get Text    ${config_config_ddl_empresa} 
    IF    "${empresa_text.strip()}" == "- Empresa -"
        Log    Empresa já selecionada - "${empresa_text.strip()}"
    ELSE
        Click    ${config_config_ddl_empresa} 
        Click    xpath=*//ul[@class="multiselect-container dropdown-menu"]//label[text()[normalize-space() = '- Empresa -']]
        Sleep    2s
    END