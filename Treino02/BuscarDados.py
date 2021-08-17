import  requests
import  json

from requests.models import Response


#curl -X GET --header 'Accept: application/json' --header "authorization: Bearer <API token>" 'https://api.clashroyale.com/v1/clans/9V2Y'
#request = requests.get("https://api.clashroyale.com/v1/clans/9V2Y")
#print   (result)

headers = {
    'Accept': 'application/json',
    'authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjdhZWNjY2FkLWE2Y2UtNGUyMi1iMjA5LTc3NmFlNzVjNzcxMSIsImlhdCI6MTYyOTE1Nzc0NSwic3ViIjoiZGV2ZWxvcGVyLzQ3OTc1ZmNlLWZlMjYtYzQzNC0wOTZlLTE2Y2RiMzBlMGEzYSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxODkuNTQuMjIwLjIzNiIsIjE4OS41NC4yMjAuMjM2Il0sInR5cGUiOiJjbGllbnQifV19.KexUpjL0uXzz5DFADiVqRdcQ3Dx5lPwMe2UxSvBT0nrVq4CcupTzCuOJivkLMAv5xCInXLl1D9oJSypZwzwmKg'
}

#URL_TAGS = "https://api.clashroyale.com/v1/clans/9V2Y"
URL_NAME = "https://api.clashroyale.com/v1/clans?name=The%20resistance"

result = requests.get(URL_NAME,headers=headers)
#comments = json.loads(Response.content)


#print(result.status_code)
#print(result.content)
#print(result.json())
#.JSON e um dicionario
print(result.json('tag:#9V2YV8YJ'))
