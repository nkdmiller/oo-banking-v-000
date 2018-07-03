class Transfer
  @@all = []
  @@executed = []
  attr_accessor :sender, :reciever, :transfer_amount
  def initialize(sender, reciever, transfer_amount)
    @sender = sender
    @reciever = reciever
    @transfer_amount = transfer_amount
    @status = "pending"
    @@all << self
  end
  def valid?
    if @sender.valid? == true && @reciever.valid? == true
      return true
    else
      return false
    end
  end
  def execute_transfer
    if valid? == true
      @sender.balance -= @amount
      @reciever.balance += @amount
      @@executed << self
    end
  end
  def reverse_transfer(transfer)
    @sender.balance -= @amount
    @reciever.balance += @amount
    @@executed.delete(self)
    @@all.delete(self)
  end
end
