*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação página - Dados Completos
    
    # Navegação
    Click    ${mnu_dados_completos} 

    
    # Validação
    Wait For Elements State    ${dados_completos_lbl_dados_completos_nova_requisicao}       state=visible
    Wait For Elements State    ${dados_completos_lbl_odonto}                                state=visible
    Wait For Elements State    ${dados_completos_lbl_dados_completos_download}              state=visible
