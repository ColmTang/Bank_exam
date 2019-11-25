require_relative 'account.rb'
require 'test/unit'


class Account_Test < Test::Unit::TestCase
  def setup
    @account = Account.new(1234)
  end

  def test_initialize
    assert_equal("Account 1234 contains $0",@account.to_s)
  end

  def test_deposit
    @account.deposit(10)
    assert_equal(10,@account.balance)
  end

  def test_withdraw
    @account.withdraw(5)
    assert_equal(5,@account.balance)
  end

end