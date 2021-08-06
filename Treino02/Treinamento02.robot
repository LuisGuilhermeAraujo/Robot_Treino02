*** Settings ***
Documentation    Treinamento02
Library          SeleniumLibrary
Library    XML


*** Variables ***
${Navegador}           Chrome
${LinkLogin}           https://developer.clashroyale.com/#/login
${InputEmail}          id=email
${InputPassword}       id=password
${ClickLogin}          xpath=//*[@id="content"]/div/div[2]/div/div/div/div/div/div/form/div[4]/button

*** Tasks ***
Tarefa 1:
    [Documentation]    Sequencia das tarefas
    Conectar ao site
    Logando Site


*** Keywords ***

Conectar ao site
    Open Browser       ${LinkLogin}    ${Navegador}
    Maximize Browser Window
    Sleep    1s
Logando Site
    Input Text        ${InputEmail}       luis.compras123@hotmail.com
    Input Password    ${InputPassword}    password
    Click Button      ${ClickLogin}
    Clear Element      