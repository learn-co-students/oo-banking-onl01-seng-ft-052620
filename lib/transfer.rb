require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount, :transfer_counter

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @transfer_counter = 0
  end

  def valid?
    @sender.valid? && @receiver.valid? && @transfer_counter < 1
  end

  def execute_transaction
    if @sender.balance - @amount > 0 && valid?
      @transfer_counter += 1
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end
  end



end
