class Transfer
  # your code here

  attr_accessor :transfer, :status, :balance
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.balance > @amount && @status = "pending"
      @sender.balance -=@amount
      @receiver.balance +=@amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
