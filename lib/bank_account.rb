require_relative 'transfer'

class BankAccount

    attr_reader :name
    attr_accessor :status, :balance

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        self.status == "open" && self.balance > 0
    end

    def deposit(amount)
        @balance += amount
    end

    def close_account
        @status = "closed"
    end

    



end
