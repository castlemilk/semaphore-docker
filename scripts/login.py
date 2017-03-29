#!/usr/bin/env python

import requests
from requests.packages.urllib3.exceptions import InsecureRequestWarning
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)
payload = { "auth": "admin", "password": "cangetmein" }
url = 'http://localhost:8081/api/auth/login'
s = requests.Session()
resp = s.post(url, data=payload, verify=False)
print resp
url = 'http://localhost:8081/projects/1'
resp = s.get(url, verify=False)
print resp

url = 'http://localhost:8081/projects/1/inventory'
resp = s.get(url, verify=False)

#print resp.content
