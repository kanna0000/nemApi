require "./test"

node = Node.new
node_ip = node.node_select
puts node_ip
puts node.heart_beat
puts node.status

puts "address: balance: importance: harvestedBlocks:  remoteStatus"

info = gets.split(" ")

addr = GetAccountData.new(address: "TCG5VOTDLYO5AM7YTE2LX2Y6M4GHSPDGTLWHUBD2", info: info)

addr.printAccountData(node_ip)
