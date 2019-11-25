require_relative 'teller.rb'
require_relative 'account.rb'

class Bank
  attr_reader :accounts, :tellers
  def initialize
    @accounts = []
    @tellers = []
  end

  include Enumerable

  def add_account(id)
    @accounts << Account.new(id)
  end

  def add_teller(name,minutes)
    @tellers << Teller.new(name,minutes)
  end

  def each
    @accounts.each do |account|

      yield account

    end
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

    def process_transactions_randomly(transactions)
      transactions.each do
        if(rand() > 0.67)
          current = @tellers.find {|teller| teller.name == "Jack"}
          current.no_transactions += 1
        elsif(rand() > 0.34)
          current = @tellers.find {|teller| teller.name == "Emma"}
          current.no_transactions += 1
        else
          current = @tellers.find {|teller| teller.name == "Paul"}
          current.no_transactions += 1
        end
      end
    end

    def process_transactions_smartly(transactions)
      counter = 0
      items = transactions.count
      while(items > 0) do
        if(items == 1)
          jack = @tellers.find {|teller| teller.name == "Jack"}
          jack.no_transactions += 1
          items -= 1
        end
        if(items > 0)
          jack = @tellers.find {|teller| teller.name == "Jack"}
          jack.no_transactions += 1
          items -= 1
        end
        if((counter % 3) == 0)
          paul = @tellers.find {|teller| teller.name == "Paul"}
          paul.no_transactions += 1
          items -= 1
        end
        if((counter % 2) == 0)
          emma = @tellers.find {|teller| teller.name == "Emma"}
          emma.no_transactions += 1
          items -= 1
        end
        counter += 1
      end
    end

  def to_s
    @accounts.each do |account|
      account.to_s
    end
  end
end