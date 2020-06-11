class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)

    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount

  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @status == 'pending' && valid? && sender.balance >= @amount
      sender.withdrawal(amount)
      receiver.deposit(amount)
      @status = 'complete'
    else
      @status = 'rejected'
      'Transaction rejected. Please check your account balance.'

    end
    
    
  end

  def reverse_transfer

    if @status == 'complete' && valid? && receiver.balance >= @amount
      receiver.withdrawal(amount)
      sender.deposit(amount)
      @status = 'reversed'
    end

  end
end
