require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  @@all = []
def initialize(sender, receiver, amount)
  self.sender = sender
  self.receiver = receiver
  self.amount = amount
  self.status = "pending"
  @@all << self
end

def valid?
if self.sender.valid? && self.receiver.valid?
  return true
else
  return false
end
end

def execute_transaction
if (self.sender.balance > self.amount && self.sender.status == "open" && self.receiver.status == "open")
self.sender.balance -= self.amount
self.receiver.balance += self.amount
self.amount = 0
self.status = "complete"
else
self.status = "rejected"
"Transaction rejected. Please check your account balance."
end
end


def reverse_transfer
  @@all.pop
@previous_sender = @@all.last.sender
@previous_receiver = @@all.last.receiver
@new_amount = @@all.last.amount
self.sender.balance = @previous_sender.balance
self.receiver.balance = @previous_receiver.balance
self.status = "reversed"
end


end
