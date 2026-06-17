*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***

Navegação e Validação Menu Excluido - página Sinistro Faixa Etaria

    Click    ${mnu_relatorio} 
    ${retorno}       Run Keyword And Return Status    Get Element    ${mnu_relatorio_sinistro_agregado_sinistro_por_faixa_etaria}
    Should Not Be True    ${retorno}
    
