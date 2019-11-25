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

