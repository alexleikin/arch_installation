import requests, json, ijson
import urllib3


urllib3.disable_warnings()

token = ""
host = r"http://10.0.1.22"
http_api = r"/api/v2/users/"
url = host + http_api
my_headers = {'Authorization':  'Bearer '  + token}

response = requests.get(url, headers=my_headers, verify=False)  
data = response.json()


#print(json.dumps(data['results'][0]['id'], indent=2))
#print(json.dumps(data['results'], indent=2))
#username = json.dumps(data['results'][0]['username'])
#print(username.strip('"'))


count = (data['count'])
for i in range(count):
  userid = json.dumps(data['results'][i]['id']).strip('"')
  username = json.dumps(data['results'][i]['username']).strip('"')
  firstname = json.dumps(data['results'][i]['first_name']).strip('"')
  lastname = json.dumps(data['results'][i]['last_name']).strip('"')
  ldap_dn = json.dumps(data['results'][i]['ldap_dn']).strip('"')
  email = json.dumps(data['results'][i]['email']).strip('"')
  
  #print(userid + "|" + username + "|" + firstname + "|" + lastname + "|" + ldap_dn + "|" + email)
  http_api = "/api/v2/users/{}/roles".format(userid)
  url = host + http_api
  response = requests.get(url, headers=my_headers, verify=False)
  data_roles = response.json()

  count_r = (data_roles['count'])
  for rl in range(count_r - 1):
    resname = (json.dumps(data_roles['results'][rl]['summary_fields']['resource_name']))
    print(userid + "|" + username + "|" + firstname + "|" + lastname + "|" + ldap_dn + "|" + email + "|" + resname)
    
    
  

    #print(json.dumps(data_roles, indent=2))
