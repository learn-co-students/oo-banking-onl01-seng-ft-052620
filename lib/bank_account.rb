class BankAccount
attr_accessor  :balance, :status
attr_reader :name
@@all = []
def initialize(name)
  @name = name 
  @balance = 1000
  @status = "open"
  @@all << self 
end 
def deposit(i)
@balance += i 
end 

def self.all 
  @@all 
end 

def display_balance
  "Your balance is $#{@balance}."  
end 
def valid? 
  if @status == "open" && 
@balance > 0 
return true 
else 
  return false 
end 
end
def close_account 
@status = "closed"
  
end 
    
end
