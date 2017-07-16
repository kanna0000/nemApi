
require "open-uri"
require "json"

class Nis

  def node_select
    node_list = ["50.3.87.123", "37.120.188.83", "23.228.67.85", "104.128.226.60", "	188.68.50.161", "	150.95.145.157", "192.3.61.243"] #test net
    @selected_node = node_list[rand(node_list.length)]
    return @selected_node
  end

  def call_api
    json =  OpenURI.open_uri("http://#{@selected_node}:7890/#{@api_path}")
    r = JSON.load(json)
    return r
  end

  def heart_beat
    @api_path = "heartbeat"
  end

  def status
    @api_path = "status"
  end

end

class GetAccountData
  attr_accessor :address, :nis
  def initialize(address:, nis:)
    @address = address
    @nis = nis
  end

  def call_api
    json =  OpenURI.open_uri("http://#{@nis}:7890/#{@api_path}?#{@param}")
    r = JSON.load(json)
    return r
  end

  def get_account_data
    @api_path = "account/get"
    @param = "address=#{@address}"
  end

  def delegate_account()
    @api_path = "account/get/forwarded"
    @param = "address=#{@address}"
  end

  def delegate_account_from_publickey(pubkey)
    @api_path = "account/get/forwarded/from-public-key"
    @param = "publicKey=#{pubkey}"
  end

  def account_status
    @api_path = "account/status"
    @param = "?address=#{@address}"
  end

  def incoming_transactions
    @api_path = "account/transfers/incoming"
    @param = "address=#{@address}"
    return r
  end

  def printAccountData(info)
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
    @api_path = "account/generate"
  end
end
