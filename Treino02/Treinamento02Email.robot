*** Settings ***
Documentation    Treinamento02
Library          SeleniumLibrary
Library          DebugLibrary
Library          RPA.Email.ImapSmtp   smtp_server=smtp.gmail.com  smtp_port=587


*** Variables ***
${NAVEGADOR}               Chrome
${LINK}                    https://developer.clashroyale.com/#
${INPUTEMAIL}              id=email
${INPUTPASSWORD}           id=password
${GMAIL_USER}              developerluisaraujo@gmail.com
${GMAIL_PASSWORD}          @123456789@
