import json

with open('data.json') as f:
  data = json.load(f)
  print(json.dumps(data['datahub']['stats'], indent=2))
