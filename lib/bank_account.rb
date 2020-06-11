class BankAccount
  attr_accessor  :balance, :status
  attr_reader :name
  def initialize(name)
    @name = name
    self.balance = 1000
    self.status = "open"    
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end
  
  
  
end
