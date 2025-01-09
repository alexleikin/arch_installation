import requests, json, ijson
import urllib3

urllib3.disable_warnings()

def get_response(http_api):

  token = "iEqXcgIb4sQur1AOLryuYnZOS7s76e"
  host = r"http://10.0.1.22"
  url = host + http_api
  my_headers = {'Authorization':  'Bearer '  + token}
  response = requests.get(url, headers=my_headers, verify=False)  
  
  return response.json()


data = get_response(r"/api/v2/users/")

count = (data['count'])
for i in range(count):
  userid = json.dumps(data['results'][i]['id']).strip('"')
  username = json.dumps(data['results'][i]['username']).strip('"')
  firstname = json.dumps(data['results'][i]['first_name']).strip('"')
  lastname = json.dumps(data['results'][i]['last_name']).strip('"')
  ldap_dn = json.dumps(data['results'][i]['ldap_dn']).strip('"')
  email = json.dumps(data['results'][i]['email']).strip('"')
  
  data_roles = get_response("/api/v2/users/{}/roles".format(userid))
  
  count_roles = (data_roles['count'])
  for c in range(count_roles):
    resname = json.dumps(data_roles['results'][c]['summary_fields'].get('resource_name', '')).strip('"')
    restype = json.dumps(data_roles['results'][c]['summary_fields'].get('resource_type', '') ).strip('"')
    name = json.dumps(data_roles['results'][c]['name']).strip('"')
    print(userid + "|" + username + "|" + firstname + "|" + lastname + "|" + ldap_dn + "|" + email + "|" + resname + "|" + restype + "|" + name)

  data_teams = get_response("/api/v2/users/{}/teams".format(userid))
  count_teams = (data_teams['count'])
  if count_teams == 0:
    print(userid + "|" + username + "|" + firstname + "|" + lastname + "|" + ldap_dn + "|" + email + "|||")
  else:
    for t in range(count_teams):
      team_orgname = json.dumps(data_teams['results'][t]['summary_fields']['organization']['name'])
      team_object_role = json.dumps(data_teams['results'][t]['summary_fields']['object_roles']['admin_role']['name'])
      print(userid + "|" + username + "|" + firstname + "|" + lastname + "|" + ldap_dn + "|" + email + "|" + team_orgname + "|" + team_object_role) 




