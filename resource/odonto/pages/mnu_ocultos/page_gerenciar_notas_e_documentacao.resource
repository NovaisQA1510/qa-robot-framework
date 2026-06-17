*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegação e Validação Menu Excluido - página Notas e Documentação Odonto

    Click    ${mnu_configuracao} 
    ${retorno}       Run Keyword And Return Status    Get Element    ${mnu_configuracao_gerenciar_notas}
    Should Not Be True    ${retorno}