

class Account
  attr_reader :id
  def initialize(id)
    @id = id
    @balance = 0
  end

  def deposit(amount)
      @balance += amount
  end

  def withdraw(amount) # amount will be negative when input
      @balance += amount
  end

  def to_s
    "Account #{@id} contains $#{@balance.round(2)}"
  end

end