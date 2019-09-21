class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if valid? && sender.balance >= amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete" 
    else
      self.status = "rejected"
      p "Transaction rejected. Please check your account balance."
  end
  end




end
