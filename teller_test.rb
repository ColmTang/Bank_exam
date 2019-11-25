require 'test/unit'
require_relative 'Teller.rb'

class Teller_Test < Test::Unit::TestCase
  def setup
    @teller = Teller.new("Jane",1)
    @teller.no_transactions = 2
  end

  def test_initialize
    assert_equal("Teller Jane completed 2 transactions in 2",@teller.to_s)
  end

  def test_calculate_time
    assert_equal(2,@teller.calculate_time)
  end
end
