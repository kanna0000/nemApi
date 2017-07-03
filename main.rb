require "./test"

#puts "address: balance: importance: harvestedBlocks:  remoteStatus"
#
#info = gets.split(" ")
#
#addr = GetAccountData.new(address: "NAMJLWQLCNDVFJZ5Z6GYLS66TUS7YYAQZS767HX5", #info: info)
#
#addr.printAccountData
#

node = Node.new
node.node_select
puts node.heart_beat
puts node.status
