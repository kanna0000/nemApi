
require "open-uri"
require "json"

class Node

  def node_select
    node_list = ["37.187.70.29", "150.95.145.157", "23.228.67.85", "104.128.226.60"] #test net
    @selected_node = node_list[rand(node_list.length)]
    return @selected_node
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

  def getAccountData(node_ip, type="account")
    path = "account/get"
    json =  OpenURI.open_uri("http://#{node_ip}:7890/#{path}?address=#{@address}")

    r = JSON.load(json)[type]
    return r
  end

  def printAccountData(i)
    for n in info
      if n == "address" then
        puts "Address is #{getAccountData(i)[n]}"
      elsif n == "balance" then
        puts "Balance is #{getAccountData(i)[n]}"
      elsif n == "importance"
        puts "Importance is #{getAccountData(i)[n]}"
      elsif n == "harvestedBlocks"
        puts "Harvested blocks are #{getAccountData(i)[n]}"
      elsif n == "remoteStatus"
        puts "Delegated harvest is #{getAccountData(i,"meta")[n]}"
      end
    end
  end
end
