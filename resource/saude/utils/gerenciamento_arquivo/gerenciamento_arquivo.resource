*** Settings ***
Resource    ../base.resource

*** Keywords ***
Fazer Download CSV
    [Arguments]    ${destino}
    ${promise}    Promise To Wait For Download        saveAs=${destino}
    Click    id=csv
    ${objeto}    Wait For    ${promise}

Unzip Arquivo
    [Arguments]    ${zip_file}     ${diretorio}

    Unzip File    zip_file_path=${zip_file}    dest_dir=${diretorio}

Listar arquivos csv    
    [Arguments]    ${diretorio}    ${nome_arquivo}

    ${arquivos_csv}    List Files In Directory    ${diretorio}
    # Log    ${arquivos_csv}

    FOR      ${arquivo}   IN   @{arquivos_csv}

        ${resposta}    Run Keyword And Return Status    Should Contain     ${arquivo}    ${nome_arquivo}    
        
        IF    "${resposta}" == "${True}"

            ${arquivo_escolhido}    Set Variable    ${arquivo}

        END
     
    END

    RETURN    ${arquivo_escolhido}
