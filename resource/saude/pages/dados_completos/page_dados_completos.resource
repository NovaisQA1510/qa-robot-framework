*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página Dados Completos
    
    # Navegação
    Click    ${mnu_dados_completos} 
    
    # Validação
    Wait For Elements State    ${dados_completos_lbl_nova_requisicao}   state=visible
    Wait For Elements State    ${dados_completos_lbl_download}    state=visible

Realizar Dowload de dados completos - Pessoas
    [Arguments]    ${validador}    ${valor_limite}=100000

    ${valor_pessoas_text}    Get Text    ${dados_completos_tbl_qtd_pessoas}

    Click    ${dados_completos_btn_download_pessoas}

    IF    "${validador}" == "${True}"
        # Maior que valor_limite (1 milhão)
        Wait For Elements State    ${dados_completo_lbl_message_limite}   state=visible
        Log    Registro com mais de 1 milhão de linhas
        Click    ${dados_completos_btn_OK}         

        ${resultado}    Valor é maior que valor limite    ${valor_pessoas_text}    ${valor_limite}
        Should Be Equal    ${resultado}    ${True} 

    ELSE IF  "${validador}" == "${False}"
        # Menor que valor_limite (1 milhão)
        Wait For Elements State    ${dados_completos_lbl_filtro_pessoas}      state=visible
        Wait For Elements State    ${dados_completos_btn_export_pessoas}    state=visible
        Click    ${dados_completos_btn_fechar_pessoas} 

        ${resultado}    Valor é maior que valor limite    ${valor_pessoas_text}    ${valor_limite}
        Should Be Equal    ${resultado}    ${False} 
    END

Realizar Dowload de dados completos - Eventos
    [Arguments]    ${validador}    ${valor_limite}=100000

    ${valor_evento_text}    Get Text    ${dados_completos_tbl_qtd_evento}

    Click    ${dados_completos_btn_download_evento}

    IF    "${validador}" == "${True}"
        # Maior que valor_limite (1 milhão)
        Wait For Elements State    ${dados_completo_lbl_message_limite}   state=visible
        Log    Registro com mais de 1 milhão de linhas
        Click    ${dados_completos_btn_OK}         

        ${resultado}    Valor é maior que valor limite    ${valor_evento_text}    ${valor_limite}
        Should Be Equal    ${resultado}    ${True} 

    ELSE IF  "${validador}" == "${False}"
        # Menor que valor_limite (1 milhão)
        Wait For Elements State    ${dados_completos_lbl_filtro_evento}      state=visible
        Wait For Elements State    ${dados_completos_btn_export_evento}    state=visible
        Click    ${dados_completos_btn_fechar_evento} 

        ${resultado}    Valor é maior que valor limite    ${valor_evento_text}    ${valor_limite}
        Should Be Equal    ${resultado}    ${False} 
    END