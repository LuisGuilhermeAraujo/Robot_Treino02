*** Settings ***
Documentation    Treinamento02
Library          SeleniumLibrary
Library          DebugLibrary
Library          socket
Library          IpDinamico.py


*** Variables ***
${NAVEGADOR}               Chrome
${LINK}                    https://developer.clashroyale.com/#
${CLICKCOOKIES}            css:div[class*="cc-compliance"]
${INPUTEMAIL}              id:email
${INPUTPASSWORD}           id:password
${GMAIL_USER}              developerluisaraujo@gmail.com
${GMAIL_PASSWORD}          @123456789@
${CLICKLOGIN}              xpath://*[@id="content"]/div/div[2]/div/div/div/div/div/div/form/div[4]/button
${INPUTNAMEAPI}            id:name
${INPUTDESCRIOTIONAPI}     id:description
${INPUTIPADDRESSES1}       id:range-0
${INPUTIPADDRESSES2}       id:range-1
${CLICKNEWIP}              css:button[class*="btn btn-secondary"]
${CLICKCREATEKEY}          css:button[class*="ladda-button btn btn-primary btn-lg btn-block"]
${CLICKACESSKEY}           css:h4[class="api-key__name"]
${GETTEXTTOKEN}            css:samp


*** Tasks ***
Tarefa 1:
    [Documentation]    Sequencia das tarefas para entrar no site
    CONECTAR AO SITE
    LOGANDO SITE
    ACESSANDO PERFIL
    CRIANDO NEW KEY
    ACESSED KEY CREATED


*** Keywords ***
CONECTAR AO SITE
    [Documentation]    Sequencia das tarefas para abrir o site
    Open Browser       ${LINK}/login    ${NAVEGADOR}
    Maximize Browser Window
    Wait Until Element Is Visible    ${CLICKCOOKIES}
    Click Element    ${CLICKCOOKIES}

LOGANDO SITE
    [Documentation]    Sequencia das tarefas logar no site
    Input Text        ${INPUTEMAIL}       ${GMAIL_USER}
    Input Password    ${INPUTPASSWORD}    ${GMAIL_PASSWORD}
    Click Button      ${CLICKLOGIN}
    Wait Until Page Contains    Enter the Arena with Clash Royale API

ACESSANDO PERFIL
    [Documentation]    Sequencia das tarefas para abrir o perfil
    #Go To    ${LINK}/account
    Go To    ${LINK}/new-key

CRIANDO NEW KEY
    [Documentation]    Sequencia das tarefas para criar new key
    Wait Until Element Is Visible            ${INPUTNAMEAPI}
    Input Text    ${INPUTNAMEAPI}            LuisAPI
    Input Text    ${INPUTDESCRIOTIONAPI}     API para adicionar novas informações ao campo teste
    Input Text    ${INPUTIPADDRESSES1}       189.54.220.236
    Click Button  ${CLICKNEWIP}
    Input Text    ${INPUTIPADDRESSES2}       189.54.220.236
    Click Button  ${CLICKCREATEKEY}

ACESSED KEY CREATED
    [Documentation]    Sequencia das tarefas para acessar o created key
    Wait Until Element Is Visible  ${CLICKACESSKEY}
    Click Element                  ${CLICKACESSKEY}
    Wait Until Element Is Visible  ${GETTEXTTOKEN}
    ${TOKEN}    Get Text           ${GETTEXTTOKEN}
    Log To Console                 ${TOKEN}

##FAZER ESSA BUSCA##
##API PARA RETORNAR MEU IP EXTERNO PARAR GERAR CHAVES ALEATORIAS##