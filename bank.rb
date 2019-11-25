

class Bank
  def initialize
    @accounts = []
  end

  def add_account(id)
    @accounts << Account.new(id)
  end

  def deposit(id,amt)
    acc = @accounts.find {|account| account.id == id}
    acc.deposit(amt)
  end

  def withdraw(id,amt)
    acc = @accounts.find {|account| account.id == id}
    acc.withdraw(amt)
  end

  def compute_transaction(transaction)
    if(transaction.amount >= 0)
      deposit(transaction.id,transaction.amount)
    else
      withdraw(transaction.id,transaction.amount)
    end
  end

  def to_s
    @accounts.each do |account|
      account.to_s
    end
  end
end