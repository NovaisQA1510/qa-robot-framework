*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação e Validação Menu Excluido - página Comparativos Quantidade de Eventos

    Click    ${mnu_relatorio} 
    ${retorno}       Run Keyword And Return Status    Get Element    ${mnu_relatorio_comparativos_qtd_de_eventos}
    Should Not Be True    ${retorno}
