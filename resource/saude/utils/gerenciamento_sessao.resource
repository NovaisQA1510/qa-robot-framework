*** Settings ***
Resource    base.resource

*** Variables ***

*** Keywords ***
Criar sessão    
    [Arguments]    ${base_url}=${BASE_URL}
    New Browser    browser=${BROWSER}     headless=${HEADLESS}
    New Page       url=${base_url}

Encerrar sessão
    Close Browser

Login
    [Arguments]    ${user}    ${passcode}

    Fill Text    id=UsuarioLoginForm_login    ${user}
    Sleep    5s
    Click    id=cookie-button
    Fill Text    id=UsuarioLoginForm_senha    ${passcode}
    Sleep    1s
    Click    css=button[type=submit]

    # Sleep    15s
    
    Wait For Elements State    id=btn-config    state=visible    timeout=30
    Wait For Elements State    css=a[title="Seção para Otimização das Opções do Usuário"]    state=visible

Criar sessão e Login
    [Arguments]    ${user}    ${passcode}    ${base_url}=${BASE_URL}
    Criar sessão    ${base_url}
    Login    ${user}     ${passcode}    