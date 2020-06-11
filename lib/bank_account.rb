class BankAccount
attr_accessor :bank_account, :balance, :status, :deposit
def initialize(name)
  @bank_account = bank_account
  @name = name
  @balance = 1000
  @status = "open"
end

def name
  @name
end

def deposit(num)
@balance += num
end

def display_balance
  "Your balance is $#{@balance}."
  
end

def valid?
 if @status == "open" && @balance > 0
   true
 else
   false
 end
 end
 
def close_account
 
 self.status = "closed"
  
end


end
