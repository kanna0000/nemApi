require "./test"

node = Nis.new
node_ip = node.node_select
puts node_ip
puts node.heart_beat
puts node.status

#puts "address: balance: importance: harvestedBlocks:  remoteStatus: all:"
# => info = gets.split(" ")

addr = GetAccountData.new(address: "TCG5VOTDLYO5AM7YTE2LX2Y6M4GHSPDGTLWHUBD2", nis: node_ip)
#addr.printAccountData(info)

#addr = GetAccountData.new(address: "TCEL6AR5LBF4NYDZFILVDQMRIFR7JGWHHRMKCOHR", nis: node_ip)
#puts addr.delegate_account
#puts addr.delegate_account_from_publickey("704453f871ffa5fbdebd0aa49b70173aee4f78f7c89f31ba2f6ed44c43775d89")
data = addr.incoming_transactions
puts data["data"][1]["transaction"]
