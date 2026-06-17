*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação e Validação Menu Excluido - página Utilização por Faixa Etaria

    Click    ${mnu_relatorio} 
    ${retorno}       Run Keyword And Return Status    Get Element    ${mnu_relatorio_sinistro_agregado_utilizacao_por_faixa_etaria}
    Should Not Be True    ${retorno}











