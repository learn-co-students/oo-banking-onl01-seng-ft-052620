class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    def initialize(bank_account)
        @balance = 1000
        @status = "open"
        @name = "Avi"
    end

    def deposit(i)
        @balance = 2000
    end

    def display_balance
        return "Your balance is $#{self.balance}."
    end

    def valid?
        @broke = BankAccount.new("#{name}")
        @broke.balance = 0
        @closed = BankAccount.new("#{name}")
        @closed.balance = 0
        if @balance > 0 && @status == "open"
            return true
        else
            return false
        end
    end

    def close_account
        @status = "closed"
    end

end
