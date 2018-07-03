class Transfer
  @@all = []
  @@executed = []
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end
  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      return true
    else
      return false
    end
  end
  def execute_transfer
    if valid? == true
      @sender.balance -= @amount
      @receiver.balance += @amount
      @@executed << self
    end
  end
  def reverse_transfer(transfer)
    @sender.balance -= @amount
    @receiver.balance += @amount
    @@executed.delete(self)
    @@all.delete(self)
  end
end
