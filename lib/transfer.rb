class Transfer
	attr_accessor :status
	attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@status = "pending"
  end

  def valid?
  	self.sender.valid? && self.receiver.valid? && sender.balance - amount > 0 
  end

  def execute_transaction
  	if self.valid? && self.status == "pending"
  			sender.balance -= amount
  			receiver.balance += amount
  			self.status = "complete"
  	elsif self.status == "complete"
  		"Transaction has already been executed."
  	else
  		self.status = "rejected"
  		"Transaction rejected. Please check your account balance."
  	end
  end

  def reverse_transfer
  	if self.status == "complete"
  		sender.balance += amount
  		receiver.balance -= amount
  		self.status = "reversed"
  	end
  end
end
