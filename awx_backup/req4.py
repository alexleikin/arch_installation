import requests, json, ijson
import urllib3

urllib3.disable_warnings()

token = "iEqXcgIb4sQur1AOLryuYnZOS7s76e"
host = r"http://10.0.1.22"
http_api = r"/api/v2/users/"
url = host + http_api
my_headers = {'Authorization':  'Bearer '  + token}

response = requests.get(url, headers=my_headers, verify=False)  
data = response.json()

count = (data['count'])

for i in range(count):
  userid = json.dumps(data['results'][i]['id']).strip('"')
  username = json.dumps(data['results'][i]['username']).strip('"')
  firstname = json.dumps(data['results'][i]['first_name']).strip('"')
  lastname = json.dumps(data['results'][i]['last_name']).strip('"')
  ldap_dn = json.dumps(data['results'][i]['ldap_dn']).strip('"')
  email = json.dumps(data['results'][i]['email']).strip('"')
  
  http_api = "/api/v2/users/{}/roles".format(userid)
  url = host + http_api
  response = requests.get(url, headers=my_headers, verify=False)
  data_roles = response.json()
  count_roles = (data_roles['count'])
  for c in range(count_roles):
    try: 
      resname = json.dumps(data_roles['results'][c]['summary_fields']['resource_name'] )
      restype = json.dumps(data_roles['results'][c]['summary_fields']['resource_type'] )
      name = json.dumps(data_roles['results'][c]['name'])
      print(userid + "|" + username + "|" + firstname + "|" + lastname + "|" + ldap_dn + "|" + email + "|" + resname + "|" + restype + "|" + name)
    except:
       pass 
     
  

