class Transfer
  # your code here

  attr_accessor  :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.sender.valid? == true && self.receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
     if self.valid? && self.status == "pending" && self.sender.balance >= self.amount
       self.sender.balance -= self.amount
       self.receiver.balance += self.amount
       self.status = "complete"
     else
       self.status = "rejected"
       "Transaction rejected. Please check your account balance."
     end
   end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end


end
