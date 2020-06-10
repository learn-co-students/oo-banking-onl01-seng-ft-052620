class BankAccount
attr_accessor :balance, :status
attr_reader :name

def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
end

def deposit(number)
    self.balance += number
end

def transfer(number)
    self.balance -= number
end

def display_balance
    return "Your balance is $#{self.balance}."
end

def valid?
    balance > 0 && status == "open" ?  true : false
end

def close_account
    self.status = "closed"
end

end
