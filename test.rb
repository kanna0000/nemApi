
require "open-uri"
require "json"

class Node

  def node_select
    node_list = ["104.238.161.61", "62.75.251.134", "108.61.182.27", "108.61.168.86"]
    @selected_node = node_list[rand(node_list.length)]
  end

  def heart_beat
    json =  OpenURI.open_uri("http://#{@selected_node}:7890/heartbeat")

    r = JSON.load(json)
    return r
  end

  def status
    json =  OpenURI.open_uri("http://#{@selected_node}:7890/status")

    r = JSON.load(json)
    return r
  end

end

class GetAccountData
  attr_accessor :address, :info
  def initialize(address:, info:)
    @address = address
    @info = info
  end

  def getAccountData(type="account")
    node_list = ["104.238.161.61", "62.75.251.134", "108.61.182.27", "108.61.168.86"]
    super_node = node_list[rand(node_list.length)]
    path = "account/get"
    json =  OpenURI.open_uri("http://#{super_node}:7890/#{path}?address=#{@address}")

    r = JSON.load(json)[type]
    return r
  end

  def printAccountData()
    for n in info
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
