*** Settings ***
Resource    ../../utils/base.resource


*** Keywords ***
Navegação página Integração
    
    # Navegação
    Click    ${mnu_configuracao} 
    Click    ${mnu_integracao}
    

    # Validação
    Wait For Elements State    ${integracao_lbl_relatorio}   state=visible
    Wait For Elements State    ${integracao_btn_relatorio_medico}    state=visible
    Set Browser Timeout    timeout=60s

 Validação e Capture Plano de Saúde Dentro do Iframe
    # Validação API PowerBI 
    Wait For Elements State    ${IFRAME_XPATH}    state=visible    timeout=60s
    Set Selector Prefix    ${IFRAME_XPATH} >>>
    Wait For Elements State    ${ELEMENT_XPATH}    state=visible    timeout=30s
    ${text}    Get Text    ${ELEMENT_XPATH}
    Log    O texto capturado foi: ${text}
    Set Selector Prefix    ${None}