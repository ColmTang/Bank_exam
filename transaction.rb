

class Transaction
  attr_reader :amount, :id
  def initialize(id, amount)
    @id = id
    @amount = amount
  end
end