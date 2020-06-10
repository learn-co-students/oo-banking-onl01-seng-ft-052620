require 'pry'

class Transfer
attr_accessor :status
attr_reader :sender, :receiver, :amount

  def initialize(from, to, amount)
    @sender = from
    @receiver = to
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender_valid? && @receiver.valid? ? true : false
  end

  def sender_valid?
    sender.valid? && sender.balance > amount ? true : false
  end


  def execute_transaction
    if valid? && status == "pending"
    sender.transfer(amount)
    receiver.deposit(amount)
    self.status = "complete"
    elsif status == "complete"
      "Current transaction is rejected. The transaction was completed. Please check your account balance."
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if status == "complete"
      receiver.transfer(amount)
      sender.deposit(amount)
      self.status = "reversed"
    else
      "Transaction rejected."
    end
  end

end
