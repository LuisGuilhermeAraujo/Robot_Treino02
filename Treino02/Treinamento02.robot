*** Settings ***
Documentation    Treinamento02
Library          SeleniumLibrary
Library          DebugLibrary


*** Variables ***
${NAVEGADOR}               Chrome
${LINK}                    https://developer.clashroyale.com/#
${INPUTEMAIL}              id=email
${INPUTPASSWORD}           id=password
${GMAIL_USER}              developerluisaraujo@gmail.com
${GMAIL_PASSWORD}          @123456789@
${CLICKLOGIN}              xpath=//*[@id="content"]/div/div[2]/div/div/div/div/div/div/form/div[4]/button
${INPUTNAMEAPI}            id=name
${INPUTDESCRIOTIONAPI}     id=description
${INPUTIPADDRESSES1}       id=range-0
${INPUTIPADDRESSES2}       id=range-1
${CLICKNEWIP}              css=button[class*="btn btn-secondary"]
${CLICKCREATEKEY}          css=button[class*="ladda-button btn btn-primary btn-lg btn-block"]
${CLICKACESSKEY}           css=h4[class="api-key__name"]
${GETTEXTTOKEN}            css=button[class*="form-control input-lg"]


*** Tasks ***
Tarefa 1:
    [Documentation]    Sequencia das tarefas
    CONECTAR AO SITE
    LOGANDO SITE
    ACESSANDO PERFIL
    CRIANDO NEW KEY
    ACESSED KEY CREATED


*** Keywords ***
CONECTAR AO SITE
    [Documentation]    Sequencia das tarefas
    Open Browser       ${Link}/login    ${Navegador}
    Maximize Browser Window
    Sleep    1s

LOGANDO SITE
    [Documentation]    Sequencia das tarefas
    Input Text        ${INPUTEMAIL}    ${GMAIL_USER}
    Input Password    ${INPUTPASSWORD}    ${GMAIL_PASSWORD}
    Click Button      ${CLICKLOGIN}
    Sleep    1s

ACESSANDO PERFIL
    [Documentation]    Sequencia das tarefas
    Go To    ${Link}/account
    Sleep    1s
    Go To    ${Link}/new-key

CRIANDO NEW KEY
    [Documentation]    Sequencia das tarefas
    Input Text    ${InputNameAPI}    LuisAPI
    Input Text    ${InputDescriptionAPI}    API para adicionar novas informações ao campo
    Input Text    ${InputIPAddresses1}    189.54.220.236
    Click Button  ${ClickNewIP}
    Input Text    ${InputIPAddresses2}    189.54.220.236
    Click Button  ${ClickCreateKey}
    Sleep    1s

ACESSED KEY CREATED
    [Documentation]    Sequencia das tarefas
    Sleep    1s
    Click Element   ${ClickAcessKey}
    Sleep    1s
