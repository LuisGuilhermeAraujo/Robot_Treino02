*** Settings ***
Documentation    Treinamento02
Library          SeleniumLibrary
Library          DebugLibrary
Library          IpDinamico.py
Library          RPA.HTTP


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
    CRIANDO NEW KEY
    ACESSED KEY CREATED
    OBTER IP EXTERNO MODO 2


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

CRIANDO NEW KEY
    [Documentation]    Sequencia das tarefas para criar new key
    Go To    ${LINK}/new-key
    Wait Until Element Is Visible            ${INPUTNAMEAPI}
    Input Text    ${INPUTNAMEAPI}            LuisAPI
    Input Text    ${INPUTDESCRIOTIONAPI}     API para adicionar novas informações ao campo teste
    ${IPDINAMICO}    ObterIP Externo
    Input Text    ${INPUTIPADDRESSES1}       ${IPDINAMICO}
    Click Button  ${CLICKNEWIP}
    Input Text    ${INPUTIPADDRESSES2}       ${IPDINAMICO}
    Click Button  ${CLICKCREATEKEY}

OBTER IP EXTERNO MODO 2
    [Documentation]    Obtendo de forma no robot
    ${RESP}     Get     https://api.ipify.org/
    [Return]    ${RESP.JSON()}[IP]

ACESSED KEY CREATED
    [Documentation]    Sequencia das tarefas para acessar o created key
    Wait Until Element Is Visible  ${CLICKACESSKEY}
    Click Element                  ${CLICKACESSKEY}
    Wait Until Element Is Visible  ${GETTEXTTOKEN}
    ${TOKEN}    Get Text           ${GETTEXTTOKEN}
    [Return]    ${TOKEN}
