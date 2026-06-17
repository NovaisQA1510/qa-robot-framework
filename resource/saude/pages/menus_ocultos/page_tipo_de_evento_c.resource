*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação e Validação Menu Excluido - página Tipo de Evento (C)

    Click    ${mnu_relatorio} 
    ${retorno}       Run Keyword And Return Status    Get Element    ${mnu_relatorio_sinistro_agregado_tipo_evento_c}
    Should Not Be True    ${retorno}











