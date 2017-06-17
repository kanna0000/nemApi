# http://127.0.0.1:7890<path to API request>?<parameters>
# 104.238.161.61: Alice 7

import json
import requests

def getAccountData(address="NEM_ADRESS"):
        path = "/account/get"
        r = requests.get("http://104.238.161.61:7890" + path + "?address=" + address)

        f = json.loads(r.text)["account"]
        return f

print("address:balance:importance")
i = input(':').split(" ")

getAccountData()

for n in i:
    if n == "address":
        print("address is " + getAccountData()[n])
    elif n == "balance":
        print("balance is " + str(getAccountData()[n]))
    else:
        print("importance is " + str(getAccountData()[n]))
