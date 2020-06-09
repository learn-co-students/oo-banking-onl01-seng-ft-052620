require 'pry'
require_relative 'bank_account'


class Transfer
  # your code here

  attr_accessor :status
  attr_reader :amount, :receiver, :sender

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if(self.status == "pending" && self.valid? && sender.balance - self.amount > 0)
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if(self.status == "complete" && self.valid?)
      reverse = Transfer.new(self.receiver, self.sender, self.amount)
      reverse.execute_transaction
      self.status = "reversed"
    end
  end
    
end
