

class Teller
  attr_reader :name
  attr_accessor :no_transactions
  def initialize(name,minutes)
    @name = name
    @minutes = minutes
    @no_transactions = 0
  end

  def calculate_time
    @minutes*@no_transactions
  end

  def to_s
    "Teller #{@name} completed #{no_transactions} transactions in #{calculate_time}"
  end

end