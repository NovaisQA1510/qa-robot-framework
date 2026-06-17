*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação e Validação Menu Excluido - página Procedimentos

    Click    ${mnu_relatorio} 
    ${retorno}       Run Keyword And Return Status    Get Element    ${mnu_relatorio_prestadores_procedimentos}
    Should Not Be True    ${retorno}
