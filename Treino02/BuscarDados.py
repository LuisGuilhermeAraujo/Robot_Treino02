from os import name
from typing import List
import  requests
import  json
import  pandas as pd
import  re

def FunctionGetAPI(text):
    headers = {
        'Accept': 'application/json',
        'authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjM2Mzg3YmQxLTk1M2MtNDk0ZS1hYWQ4LWQwMzM3NDhlY2FmZSIsImlhdCI6MTYyOTMyNDQ0MSwic3ViIjoiZGV2ZWxvcGVyLzQ3OTc1ZmNlLWZlMjYtYzQzNC0wOTZlLTE2Y2RiMzBlMGEzYSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxODkuNTQuMjIwLjIzNiIsIjE4OS41NC4yMjAuMjM2Il0sInR5cGUiOiJjbGllbnQifV19.aRqIRa251t4fyCypU8c_hmOVxpi_AnmSivQ7xHmMWujDUvpSw_PITeHuVXCgrD0WU1MQEljoXo1OVSNZRc-giQ'
    }
    
    URL_NAME = "https://api.clashroyale.com/v1/clans?name=The%20resistance"
    
    result = requests.get(URL_NAME,headers=headers)
    json_itens = json.loads( result.text )
    
    
    #print(result.text)
    #print( json_itens ["items"][1] )
    for attrs in json_itens["items"]:
        if attrs["tag"].startswith( "#9V2Y" ):
            print(attrs["tag"])
            resultTag = attrs['tag']
    
    
    Paramet1 = resultTag
    ##Replace para tirar o # para %
    resultTag = resultTag.replace("#","%23")
    print(resultTag)
    
    
    URL_MEMBER1 = f"https://api.clashroyale.com/v1/clans/{resultTag}/members"
    
    print(URL_MEMBER1)
    
    ResultMember1 = requests.get(URL_MEMBER1,headers=headers)
    json_Member1 = json.loads( ResultMember1.text )
    
    #print(json_Member1)
    #nome(name), - level(expLevel), - troféus(trophies), - papel(role)
    df = pd.DataFrame(columns=['name','expLevel','trophies','role'])
    for Result in json_Member1["items"]:
        print(Result["name"])
        print(Result["expLevel"])
        print(Result["trophies"])
        print(Result["role"])
    
        df = df.append({
         'name': Result["name"],
         'expLevel':Result["expLevel"],
         'trophies':Result["trophies"],
         'role':Result["role"]
         },ignore_index=True)
        df.to_csv('test.csv', index=False, header=True)
    print (df)
