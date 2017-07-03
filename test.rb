
require "open-uri"
require "json"

class Nis

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
  attr_accessor :address, :info, :nis
  def initialize(address:, info:, nis:)
    @address = address
    @info = info
    @nis = nis
  end

  def getAccountData(type="account")
    path = "account/get"
    json =  OpenURI.open_uri("http://#{nis}:7890/#{path}?address=#{@address}")
    r = JSON.load(json)[type]  #if type is "meta", this shows status, remoteStatus, cosignatoryOf
    return r
  end

  def printAccountData()
    for n in info
      if n == "address" then
        puts "Address is #{getAccountData()[n]}"
      elsif n == "balance" then
        puts "Balance is #{getAccountData()[n]}"
      elsif n == "importance"
        puts "Importance is #{getAccountData()[n]}"
      elsif n == "harvestedBlocks"
        puts "Harvested blocks are #{getAccountData()[n]}"
      elsif n == "remoteStatus"
        puts "Delegated harvest is #{getAccountData("meta")[n]}"
      end
    end
  end
end

class Crypto
  attr_accessor :nis
  def initialize
    @nis = nis
  end

  def generate_account
    json = OpenURI.open_uri("http://#{nis}:7890/account/generate")
    r = JSON.load(json)
    return r
  end


end
