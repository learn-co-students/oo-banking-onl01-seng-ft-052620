require "pry"

class Transfer 
  attr_accessor :name, :sender, :status, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @name = name
    @status = "pending"
    @receiver = receiver
    @amount = amount
  end
  
  def valid? 
    if @sender || @receiver == valid? 
      true 
    else 
      false 
    end
 sender.valid?
    receiver.valid?
  end
  
  
  def execute_transaction 
if valid? && sender.balance >= amount && @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer 
   if valid? && receiver.balance >= amount && @status == "complete"
  receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
end
