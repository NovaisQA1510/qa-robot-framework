<div align="center">

# QA Robot Framework

![Robot Framework](https://img.shields.io/badge/Robot_Framework-7.0.1-000000?style=for-the-badge&logo=robotframework&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Playwright](https://img.shields.io/badge/Playwright-Browser_18.8.1-45ba4b?style=for-the-badge&logo=playwright&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

**Framework de automação de testes E2E para aplicações Web e BI**  
Baseado em experiência profissional real, utilizando Page Object Model adaptado para Robot Framework.

</div>

---

## Sumário

- [Sobre o Projeto](#sobre-o-projeto)
- [Tecnologias](#tecnologias)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Instalação](#instalação)
- [Configuração do Ambiente](#configuração-do-ambiente)
- [Execução dos Testes](#execução-dos-testes)
- [Boas Práticas Aplicadas](#boas-práticas-aplicadas)
- [Como Adicionar Novos Módulos](#como-adicionar-novos-módulos)
- [Autor](#autor)

---

## Sobre o Projeto

Este repositório é um **template profissional** de automação de testes construído com Robot Framework, cobrindo testes End-to-End em aplicações Web e relatórios de Business Intelligence (Power BI). A arquitetura é baseada no padrão **Page Object Model (POM) adaptado para Robot Framework**, garantindo organização, reusabilidade e manutenibilidade dos testes.

O projeto cobre dois módulos principais de negócio:

- **Saúde** — Testes de configuração, relatórios, integração com API Power BI, validação de dados e funcionalidades de tela.
- **Odonto** — Testes de configuração, relatórios, menus e navegação para o módulo odontológico.

---

## Tecnologias

| Tecnologia | Versão | Descrição |
|---|---|---|
| [Robot Framework](https://robotframework.org/) | 7.0.1 | Framework principal de automação |
| [Python](https://www.python.org/) | 3.10+ | Linguagem base do projeto |
| [robotframework-browser](https://robotframework-browser.org/) | 18.8.1 | Biblioteca de browser via Playwright |
| [robotframework-csvlibrary](https://github.com/s4int/robotframework-CSVLibrary) | 0.0.5 | Manipulação de arquivos CSV |
| [robotframework-pythonlibcore](https://github.com/robotframework/PythonLibCore) | 4.5.0 | Suporte a bibliotecas Python customizadas |
| [robotframework-assertion-engine](https://github.com/MarketSquare/AssertionEngine) | 3.0.3 | Motor de asserções avançadas |
| [protobuf](https://protobuf.dev/) | 5.28.1 | Dependência do Browser (gRPC) |
| [Node.js](https://nodejs.org/) | LTS | Dependência do robotframework-browser |

---

## Estrutura do Projeto

```
qa-robot-framework/
├── envs/
│   ├── env_example.resource        # Template de variáveis de ambiente (versionado)
│   └── env_local.resource          # Credenciais reais locais (ignorado pelo git)
│
├── resource/
│   ├── saude/                      # Módulo Saúde
│   │   ├── data/                   # Massa de dados para os testes
│   │   ├── locators/               # Seletores CSS/XPath por página
│   │   │   ├── Individual/
│   │   │   ├── configuracao/
│   │   │   ├── relatorios/
│   │   │   └── ...
│   │   ├── pages/                  # Keywords de ação por página (Page Objects)
│   │   │   ├── configuracao/
│   │   │   ├── relatorios/
│   │   │   └── ...
│   │   └── utils/
│   │       ├── base.resource       # Importações globais e bibliotecas
│   │       ├── gerenciamento_sessao.resource   # Login / sessão
│   │       ├── utils.resource      # Keywords utilitárias genéricas
│   │       └── gerenciamento_arquivo/          # Lib Python customizada para arquivos
│   │
│   └── odonto/                     # Módulo Odonto (mesma estrutura do Saúde)
│       ├── data/
│       ├── locators/
│       ├── pages/
│       └── utils/
│
├── test/
│   ├── saude/                      # Suítes de teste — Módulo Saúde
│   │   ├── test_configuracao_empresa.robot
│   │   ├── test_formulas.robot
│   │   ├── test_integracao_api_powerbi.robot
│   │   ├── funcionalidades_telas/
│   │   ├── test_csv/
│   │   ├── test_navegacao/
│   │   ├── test_correlacao_tela/
│   │   ├── test_reprocessamento/
│   │   └── test_menus_ocultos/
│   │
│   └── odonto/                     # Suítes de teste — Módulo Odonto
│       ├── test_configuracao_empresa.robot
│       ├── test_navegacao/
│       └── test_menus_ocultos/
│
├── results/                        # Relatórios gerados (ignorado pelo git)
├── requirements.txt
└── README.md
```

---

## Instalação

**Pré-requisitos:** Python 3.10+, Node.js (LTS)

```bash
# 1. Clone o repositório
git clone https://github.com/NovaisQA1510/qa-robot-framework.git
cd qa-robot-framework

# 2. (Opcional) Crie e ative um ambiente virtual
python -m venv .venv
source .venv/bin/activate   # Linux/macOS
# .venv\Scripts\activate    # Windows

# 3. Instale as dependências Python
pip install -U -r requirements.txt

# 4. Inicialize a biblioteca Browser (instala o Playwright internamente)
rfbrowser init
```

---

## Configuração do Ambiente

O projeto utiliza arquivos `.resource` para isolar variáveis de ambiente das credenciais reais.

```bash
# Copie o arquivo de exemplo para env_local.resource
cp envs/env_example.resource envs/env_local.resource
```

Edite `envs/env_local.resource` com suas credenciais:

```robot
*** Variables ***
${BASE_URL}       https://sua-aplicacao.com/
${BROWSER}        chromium
${HEADLESS}       ${False}
${USERNAME}       seu-usuario@empresa.com
${PASSWORD}       SuaSenha123
```

> O arquivo `env_local.resource` está no `.gitignore` — **nunca versione credenciais reais**.

---

## Execução dos Testes

### Executar todos os testes de um módulo

```bash
# Módulo Saúde
robot test/saude/

# Módulo Odonto
robot test/odonto/
```

### Executar uma suíte específica

```bash
robot test/saude/test_configuracao_empresa.robot
```

### Filtrar por tag

```bash
robot --include config-empresa test/saude/
robot --include navegacao test/odonto/
```

### Definir diretório de resultados

```bash
robot --outputdir results/ test/saude/
```

### Executar em modo headless (CI/CD)

```bash
robot --variable HEADLESS:True --outputdir results/ test/saude/
```

---

## Boas Práticas Aplicadas

### Page Object Model adaptado para Robot Framework
Cada página possui dois arquivos dedicados na camada `resource`:
- **`locators/`** — apenas variáveis com os seletores (CSS, XPath, ID).
- **`pages/`** — apenas keywords de ação que consomem os locators.

Essa separação permite trocar seletores sem tocar na lógica de negócio.

### Separação de camadas

| Camada | Responsabilidade |
|---|---|
| `locators/` | Onde o elemento está na tela |
| `pages/` | O que fazer naquela tela |
| `utils/` | Como configurar sessão e utilitários transversais |
| `data/` | Com qual dado o teste opera |
| `test/` | O que o negócio precisa validar |

### Gerenciamento de ambiente por arquivo `.resource`
Variáveis sensíveis (URL, usuário, senha) ficam em `env_local.resource`, separado do código-fonte e nunca versionado.

### Tags nos testes
Todas as suítes utilizam `[Tags]` para permitir execução seletiva por funcionalidade, facilitando pipelines de CI/CD que executam apenas testes relevantes ao contexto.

### Bibliotecas Python customizadas
Funções específicas como gerenciamento de arquivos CSV de download ficam em módulos Python dentro de `utils/`, mantendo a lógica complexa fora dos arquivos `.resource`.

---

## Como Adicionar Novos Módulos

Siga a convenção já estabelecida para `saude` e `odonto`:

### 1. Crie a estrutura de pastas

```bash
mkdir -p resource/<novo_modulo>/data
mkdir -p resource/<novo_modulo>/locators
mkdir -p resource/<novo_modulo>/pages
mkdir -p resource/<novo_modulo>/utils
mkdir -p test/<novo_modulo>
```

### 2. Crie o `base.resource` do módulo

```robot
# resource/<novo_modulo>/utils/base.resource
*** Settings ***
Library    Browser    auto_closing_level=KEEP
Library    Collections
Library    OperatingSystem

Resource    ../../../envs/env_local.resource
Resource    gerenciamento_sessao.resource
Resource    utils.resource
```

### 3. Crie os locators de uma página

```robot
# resource/<novo_modulo>/locators/locator_minha_pagina.resource
*** Variables ***
${minha_pagina_btn_salvar}    css=button#salvar
${minha_pagina_lbl_titulo}    css=h1.titulo
```

### 4. Crie as keywords da página

```robot
# resource/<novo_modulo>/pages/page_minha_pagina.resource
*** Settings ***
Resource    ../../utils/base.resource

*** Keywords ***
Navegar para Minha Página
    Click    ${mnu_minha_pagina}
    Wait For Elements State    ${minha_pagina_lbl_titulo}    state=visible

Salvar formulário
    Click    ${minha_pagina_btn_salvar}
    Wait For Elements State    text=Salvo com sucesso.    state=visible
```

### 5. Crie a suíte de teste

```robot
# test/<novo_modulo>/test_minha_funcionalidade.robot
*** Settings ***
Resource    ../../resource/<novo_modulo>/utils/base.resource

Suite Setup       Criar sessão e Login    ${USERNAME}    ${PASSWORD}
Suite Teardown    Encerrar sessão

*** Test Cases ***
Minha Funcionalidade - Cenário 1
    [Tags]    minha-tag
    Navegar para Minha Página
    Salvar formulário
```

---

## Autor

<div align="center">

**Marcus Vinícius Novais**  
*QA Engineer & Automation Specialist*

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Marcus_Vinícius-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/marcus-vinicius-oliveira-novais)
[![GitHub](https://img.shields.io/badge/GitHub-NovaisQA1510-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/NovaisQA1510)
[![Email](https://img.shields.io/badge/Email-marcus.novaisenge%40gmail.com-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:marcus.novaisenge@gmail.com)

</div>
