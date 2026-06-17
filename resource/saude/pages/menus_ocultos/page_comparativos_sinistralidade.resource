*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação e Validação Menu Excluido - página Comparativos Sinistralidade

    Click    ${mnu_relatorio} 
    ${retorno}       Run Keyword And Return Status    Get Element    ${mnu_relatorio_comparativos_sinistralidade}
    Should Not Be True    ${retorno}
