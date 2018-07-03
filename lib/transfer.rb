require 'pry'
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
  def execute_transaction
    binding.pry
    if valid? == true && @@executed.include?(self) == false && (@amount > @sender.balance) == false
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
      @@executed << self
    else
      return "Transaction rejected. Please check your account balance."
      self.status = "rejected"
      binding.pry
    end
  end
  def reverse_transfer(transfer)
    @sender.balance -= @amount
    @receiver.balance += @amount
    @@executed.delete(self)
    @@all.delete(self)
  end
end
