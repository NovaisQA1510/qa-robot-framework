*** Settings ***
Resource    base.resource

*** Variables ***

*** Keywords ***
Criar sessão
    New Browser    browser=${BROWSER}     headless=${HEADLESS}
    New Page       url=${BASE_URL}

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
    [Arguments]    ${user}    ${passcode}
    Criar sessão
    Login    ${user}     ${passcode}