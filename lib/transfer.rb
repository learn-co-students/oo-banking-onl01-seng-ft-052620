class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount, :transfer_record
  
  def initialize(sender, receiver, value)
    @sender =sender
    @receiver = receiver
    @status = 'pending'
    @amount = value
    @transfer_record =[]
    
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.sender.balance > @amount
    sender.balance -=@amount;
    receiver.balance +=@amount
    @transfer_record << [@sender, @receiver, @amount]
    @amount =0
    @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance." 
  
  end
  end

  def reverse_transfer
    if transfer_record.last
    sender = @transfer_record.last[0]
    receiver = @transfer_record.last[1]
    amount =@transfer_record.last[2]
    sender.balance+=amount
    receiver.balance-=amount
    @status = 'reversed'
    else
      'No Transaction to reverse'
    end


  end


end


# it "rejects a transfer if the sender does not have enough funds (does not have a valid account)" do
#   terrance.close_account
#   closed_account_transfer = Transfer.new(amanda, terrance, 50)
#   expect(closed_account_transfer.execute_transaction).to eq("Transaction rejected. Please check your account balance.")
#   expect(closed_account_transfer.status).to eq("rejected")

#   expect(bad_transfer.execute_transaction).to eq("Transaction rejected. Please check your account balance.")
#   expect(bad_transfer.status).to eq("rejected")
# end
# end