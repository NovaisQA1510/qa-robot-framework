*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação e Validação Menu Excluido - página Resumo Indicadores Executivo

    Click    ${mnu_relatorio} 
    ${retorno}       Run Keyword And Return Status    Get Element    ${mnu_relatorio_resumo_de_indicadores_Executivo}
    Should Not Be True    ${retorno}
      