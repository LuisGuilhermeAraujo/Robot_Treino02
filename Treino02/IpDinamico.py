import requests

def ObterIP_Externo(): 
    Ip_Externo = requests.get('https://api.ipify.org/').text
    return Ip_Externo