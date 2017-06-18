# http://127.0.0.1:7890<path to API request>?<parameters>
# 104.238.161.61: Alice 7

import json
import requests

nemAddress = "NEM_ADDRESS"

print("address: balance: importance: harvestedBlocks: remoteStatus")
i = input(':').split(" ")

def getAccountData(types="account",address=nemAddress):
        path = "/account/get"
        r = requests.get("http://104.238.161.61:7890" + path + "?address=" + address)

        f = json.loads(r.text)[types]
        return f

def printAccountData():
    for n in i:
        if n == "address":
            print("Address is " + getAccountData()[n])
        elif n == "balance":
            print("Balance is " + str(getAccountData()[n]))
        elif n == "importance":
            print("Importance is " + str(getAccountData()[n]))
        elif n == "remoteStatus":
            print("Remote harvesting is  " + str(getAccountData("meta")[n]))
        elif n == "harvestedBlocks":
            print("Harvested blocks are " + str(getAccountData()[n]))

printAccountData()
