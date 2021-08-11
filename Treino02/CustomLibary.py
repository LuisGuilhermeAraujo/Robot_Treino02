import re

def extrair_link(text):
    pattern = r'(?=https:\/\/)(.+?)(\\)'
    if match := re.search(pattern, text):
        link = match.group(1)
        return link