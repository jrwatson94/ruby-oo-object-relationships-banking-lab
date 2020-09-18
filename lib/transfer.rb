class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender,receiver,amount,status="pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status == "pending" && self.sender.balance > @amount && self.valid?
      self.sender.deposit(-@amount) 
      self.receiver.deposit(@amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(@amount) 
      self.receiver.deposit(-@amount)
      self.status = "reversed"
    end
  end


end
