*** Settings ***
Documentation    Treinamento02
Library          SeleniumLibrary
Library          DebugLibrary         


*** Variables ***
${Navegador}               Chrome
${Link}                    https://developer.clashroyale.com/#
${InputEmail}              id=email
${InputPassword}           id=password
${ClickLogin}              xpath=//*[@id="content"]/div/div[2]/div/div/div/div/div/div/form/div[4]/button
#${ClickSubMenu}           css=button[class*="dropdown-toggle"]
#${ClickItemMenu}          xpath=//a[contains(text(),"My Account")]
#${ClickNewKey}            xpath=//*[@id="content"]/div/div[2]/div/div/section[2]/div/div/div[2]/p/a/span[2]/font/font
${InputNameAPI}            id=name
${InputDescriptionAPI}     id=description
${InputIPAddresses1}       id=range-0
${InputIPAddresses2}       id=range-1
${ClickNewIP}              css=button[class*="btn btn-secondary"]
${ClickCreateKey}          css=button[class*="ladda-button btn btn-primary btn-lg btn-block"]
${ClickAcessKey}           css=h4[class="api-key__name"]                    
${GetTextToken}            css=button[class*="form-control input-lg"]


*** Tasks ***
Tarefa 1:
    [Documentation]    Sequencia das tarefas
    Conectar ao site
    Logando Site
    Acessando Perfil
    Criando New Key
    Acessed Key Create


*** Keywords ***

Conectar ao site
    Close All Browsers
    Open Browser       ${Link}/login    ${Navegador}
    Maximize Browser Window
    Sleep    1s

Logando Site
    Input Text        ${InputEmail}       luis.compras123@hotmail.com
    Input Password    ${InputPassword}    password
    Click Button      ${ClickLogin}
    Sleep    1s

Acessando Perfil
    Go To    ${Link}/account
    Sleep    1s
    #Click Element     ${ClickSubMenu}
    #Clear Element     ${ClickItemMenu}
    #Click Button       ${ClickNewKey}
    Go To    ${Link}/new-key

Criando New Key
    Input Text    ${InputNameAPI}    LuisAPI
    Input Text    ${InputDescriptionAPI}    API para adicionar novas informações ao campo
    Input Text    ${InputIPAddresses1}    189.54.220.236
    Click Button  ${ClickNewIP}
    Input Text    ${InputIPAddresses2}    189.54.220.236
    Click Button  ${ClickCreateKey}
    Sleep    1s

Acessed Key Create
    Sleep    1s
    #Debug
    Click Element   ${ClickAcessKey}
    Sleep    1s
    