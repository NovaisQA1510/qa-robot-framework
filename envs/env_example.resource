*** Variables ***
# Copie este arquivo para env_local.resource e preencha com suas credenciais reais.
# NUNCA versione o env_local.resource — ele está no .gitignore.

${BASE_URL}       https://yourapp.example.com/
${BROWSER}        chromium
${HEADLESS}       ${False}
${USERNAME}       user@example.com
${PASSWORD}       YourPassword123

# Ambiente de Comparação de Reprocessamento (opcional)
${BASE_URL_2}       https://yourapp2.example.com/
${USERNAME_2}       user2@example.com
${PASSWORD_2}       YourPassword456
