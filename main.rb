require "./test"

node = Nis.new
node_ip = node.node_select
puts node.heart_beat
puts node.status

puts "address: balance: importance: harvestedBlocks:  remoteStatus"
info = gets.split(" ")

addr = GetAccountData.new(address: "TCG5VOTDLYO5AM7YTE2LX2Y6M4GHSPDGTLWHUBD2", info: info, nis: node_ip)

addr.printAccountData()
