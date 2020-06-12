class Transfer
  # your code here
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @status = "pending" 
    @amount = amount 
  end 
  
  def valid?
    if @sender.valid? && @receiver.valid? 
      true 
    else 
      false 
    end 
  end 
  
  def execute_transaction
    if valid? && @status == 'pending' && sender.balance >= @amount
      @sender.deposit -@amount 
      @receiver.deposit +@amount 
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
    if @status == "complete"
      @sender.deposit +@amount
      @receiver.deposit -@amount
      @status = "reversed"
    end
  end 
  
end