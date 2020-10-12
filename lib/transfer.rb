class Transfer
  # your code here

  attr_accessor :transfer, :status
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
    sender.balance -=amount
    receiver.balance +=amount
    self.status = "complete"
  end

end
