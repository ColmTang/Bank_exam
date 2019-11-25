require_relative 'bank.rb'
require_relative 'account.rb'
require_relative 'transaction.rb'

bank = Bank.new
q1 = Bank.new

puts "========= part 1 =========="

q1.add_account(1234)
q1.add_account(2345)
q1.add_account(3456)
q1.deposit(1234,12.84)
q1.deposit(2345,23.95)
q1.deposit(3456,35.06)
q1.withdraw(1234,14.50)
q1.withdraw(2345,0.50)
q1.withdraw(3456,0.50)
puts q1.to_s

puts "========= part 2 =========="

IO.foreach("accounts.txt") do |line|
  data = line.split
  bank.add_account(data[0])
end

IO.foreach("transactions.txt") do |line|
  data = line.split
  bank.compute_transaction(Transaction.new(data[0],data[1].to_f))
end

puts bank.to_s

puts "========= part 3 =========="

max = bank.map {|account| account.balance}.max
puts "max account balance in bank is: $#{max.round(2)}"
avg = bank.map(&:balance).inject(0,&:+)
total = avg
avg = avg/bank.count
puts "average account balance in bank is: $#{avg.round(2)}"
puts "total amount of funds in bank is: $#{total.round(2)}"

puts "========= part 4a =========="

bank.add_teller("Jack",1)
bank.add_teller("Emma",2)
bank.add_teller("Paul",3)

all_transactions = []

IO.foreach("transactions.txt") do |line|
  data = line.split
  all_transactions << Transaction.new(data[0],data[1])
end

bank.process_transactions_randomly(all_transactions) # 4a
puts bank.tellers.each {|teller| teller.to_s}

puts "========= part 4b =========="

q4b = Bank.new

IO.foreach("accounts.txt") do |line|
  data = line.split
  q4b.add_account(data[0])
end

IO.foreach("transactions.txt") do |line|
  data = line.split
  q4b.compute_transaction(Transaction.new(data[0],data[1].to_f))
end

q4b.add_teller("Jack",1)
q4b.add_teller("Emma",2)
q4b.add_teller("Paul",3)

q4b.process_transactions_smartly(all_transactions)
puts q4b.tellers.each {|teller| teller.to_s}
