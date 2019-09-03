class Transfer
  # your code here
  attr_accessor :sender, :receiver, :transfer, :amount
  attr_reader :status

  def initialize(sender, receiver, transfer)
    @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    # if @sender.valid? && @status != "complete" && @sender.balance > @amount
    #     @sender.balance -= @amount
    #     @receiver.balance += @amount
    #     @status = "complete"
    #  elsif @sender.balance < @amount
    #     @status = "rejected"
    #     "Transaction rejected. Please check your account balance."
    #  end
    if !self.both_valid? || sender.balance < amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    end
  end


  def reverse_transfer
    if @sender.valid? && @status == "complete" && @sender.balance > @amount
       @sender.balance += @amount
       @receiver.balance -= @amount
       @status = "reversed"
    end
  end

end
