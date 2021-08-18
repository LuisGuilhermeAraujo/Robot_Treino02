import  requests
import  json
import  csv
import  pandas as pd


from requests.models import Response


headers = {
    'Accept': 'application/json',
    'authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImQyYjExYTYxLWNiOTUtNGRjMC1iZjU2LTg3YWVjOWIwZDI1OSIsImlhdCI6MTYyOTI5ODA0Niwic3ViIjoiZGV2ZWxvcGVyLzQ3OTc1ZmNlLWZlMjYtYzQzNC0wOTZlLTE2Y2RiMzBlMGEzYSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyI0NS4xNjIuMTk5LjE4NiIsIjQ1LjE2Mi4xOTkuMTg2Il0sInR5cGUiOiJjbGllbnQifV19.hrtTp12_w2ygWNV1FbyuU95TjBjBQzDp6vwNN9uNfHbCB7-Un73Q9NSreMCEcGldjKYAFTCAPsJSeVJ7rVzoLQ'
}

URL_NAME = "https://api.clashroyale.com/v1/clans?name=The%20resistance"

result = requests.get(URL_NAME,headers=headers)
json_itens = json.loads( result.text )


#print(result.text)
print( json_itens ["items"][0] )
for attrs in json_itens["items"]:
    if attrs["tag"].startswith( "#9V2Y" ):
        print(attrs["tag"])
        print(attrs["name"])
        print(attrs["clanChestLevel"])
        print(attrs["clanWarTrophies"])
        print(attrs["type"])

        Create_File = open('Create_File.csv','w', header = None, sep = ',', encoding = 'utf-8',engine='c')
        CSV_WRITE = csv.writer(Create_File)

        CSV_WRITE.writerow({"tag","name","clanChestLevel","clanWarTrophies"})
        CSV_WRITE.writerow({attrs["tag"],attrs["name"],attrs["clanChestLevel"],attrs["clanWarTrophies"]})

        Create_File.close()

        break
    else:
        print('Tag não encontrada!')