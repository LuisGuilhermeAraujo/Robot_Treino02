*** Settings ***
Documentation    Treinamento02

Library          String
Library          SeleniumLibrary
Library          DebugLibrary
Library          RPA.Email.ImapSmtp   smtp_server=smtp.gmail.com  smtp_port=587
Library          CustomLibary.py


*** Variables ***
${NAVEGADOR}               Chrome
${LINK}                    https://developer.clashroyale.com/#
${INPUTNAME}               id=name
${INPUTEMAIL}              id=email
${INPUTPASSWORD}           id=password
${INSERTNAME}              Luis Developer
${INSERTPASSWORD}          id=password
${INSERTPASSWORD2}         id=password2
${GMAIL_USER}              developerluisaraujo@gmail.com
${GMAIL_PASSWORD}          @123456789@
${CLICKSUBMIT}             css=button[class*="ladda-button register-btn btn btn-primary btn-lg"]
${CLICKPRIVACY}            css=div[class*="checkbox"]
${CLICKSUBMIT2}            css=button[class*="ladda-button register-btn btn btn-primary btn-lg"]
${CLICKCOOKIES}            css=div[class*="cc-compliance"]


*** Tasks ***
Tarefa 2:
    [Documentation]    sequencia das tarefas
    #LOGANDO NO SITE
    #REALIZAR O CADSATRO NO SITE
    VERIFICAR EMAIL DE CONFIRMAÇÃO
    CRIANDO A SENHA


*** Keywords ***
LOGANDO NO SITE
    [Documentation]    Logando no site
    Open Browser       ${LINK}/register    ${NAVEGADOR}
    Maximize Browser Window
    Sleep    1s

REALIZAR O CADSATRO NO SITE
    [Documentation]    Usuario se cadastrando no site
    Input Text             ${INPUTNAME}     ${INSERTNAME}
    Input Text             ${INPUTEMAIL}    ${GMAIL_USER}
    Click Button           ${CLICKSUBMIT}

VERIFICAR EMAIL DE CONFIRMAÇÃO
    [Documentation]    tarefa de verifica de email
    Authorize        ${GMAIL_USER}        ${GMAIL_PASSWORD}
    @{EMAIL}         List Messages        SUBJECT "Welcome to the Clash Royale API"
    ${EMAIL_BODY}    Set Variable         ${EMAIL}[0][Body]
    ${LINKS}         Extrair Link         ${EMAIL_BODY}
    Open Browser     ${LINKS}             ${NAVEGADOR}

CRIANDO A SENHA
    [Documentation]    Criação de senha no site
    Maximize Browser Window
    Sleep    1s
    Click Element    ${CLICKCOOKIES}
    Sleep    1s
    Input Text       ${INSERTPASSWORD}    ${GMAIL_PASSWORD}
    Input Text       ${INSERTPASSWORD2}   ${GMAIL_PASSWORD}
    Click Element    ${CLICKPRIVACY}
    Click Button     ${CLICKSUBMIT}
