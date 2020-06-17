class Transfer
  
attr_accessor :sender, :receiver, :status, :amount 

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

 def valid?
   self.sender.valid? && self.receiver.valid?
 end

 def execute_transaction
   if @status == "pending" then
     
     if (@sender.status == "open" && @sender.balance > @amount) then
       @sender.deposit(0 - @amount)
       @receiver.deposit(@amount)
       @status = "complete"
       returnvalue = "complete"
     else
       @status = "rejected"
       returnvalue = "Transaction rejected. Please check your account balance."
     end
     
   end
   returnvalue 
 end
 
 def reverse_transfer
   if @status == "complete" then
     @receiver.deposit(0 - @amount)
     @sender.deposit(@amount)
   end
   @status = "reversed"
 end
 
end
 
amanda = BankAccount.new(amanda)
terrance = BankAccount.new(terrance)
amanda.close_account
puts amanda.status
puts terrance.status
closed_account_transfer = Transfer.new(amanda, terrance, 50)
closed_account_transfer.execute_transaction
