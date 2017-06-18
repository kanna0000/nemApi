
require "open-uri"
require "json"

def getAccountData
  path = "account/get"
  json = OpenURI.open_uri("http://104.238.161.61:7890/" + path + "?address=NEM_ADDRESS")

  r = JSON.load(json)["account"]

  return r
end

puts "address:balance:importance"
i = gets.split(" ")

getAccountData()

for n in i
  if n == "address" then
    puts "address is " + getAccountData[n]
  elsif n == "balance" then
    puts "balance is " + getAccountData[n].to_s
  else
    puts "importance is " + getAccountData[n].to_s
  end
end
