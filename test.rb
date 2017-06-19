
require "open-uri"
require "json"

class GetAccountData

  def initialize
    @nemAddress = "NEM_ADDRESS"
  end

  def getAccountData(type="account")
    path = "account/get"
    json =  OpenURI.open_uri("http://104.238.161.61:7890/#{path}?address=#{@nemAddress}")

    r = JSON.load(json)[type]

    return r
  end

  def printAccountData(i)
    for n in i
      if n == "address" then
        puts "Address is #{getAccountData[n]}"
      elsif n == "balance" then
        puts "Balance is #{getAccountData[n]}"
      elsif n == "importance"
        puts "Importance is #{getAccountData[n]}"
      elsif n == "harvestedBlocks"
        puts "Harvested blocks are #{getAccountData[n]}"
      elsif n == "remoteStatus"
        puts "Delegated harvest is #{getAccountData("meta")[n]}"
      end
    end
  end
end


puts "address: balance: importance: harvestedBlocks:  remoteStatus"
i = gets.split(" ")

addr = GetAccountData.new
addr.printAccountData(i)
