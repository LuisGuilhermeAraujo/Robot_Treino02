*** Settings ***
Documentation    Treinamento02
Library          SeleniumLibrary
Library          DebugLibrary
Library          RPA.Email.ImapSmtp   smtp_server=smtp.gmail.com  smtp_port=587


*** Variables ***
${NAVEGADOR}               Chrome
${LINK}                    https://developer.clashroyale.com/#
${GMAIL_USER}              Conta_Name
${GMAIL_PASSWORD}          Conta_Senha


*** Tasks ***
Teste key


*** Keywords ***
Teste Key
    Authorize            luisaraujo664@gmail.com