class BankAccount
  attr_accessor :name
  attr_reader :balance, :status
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
  def deposit

  end
  def display_balance

  end
  def valid?
    if @status == "open" && @balance > 0
      return true
    else
      return false
    end
  end
  def close_account
    @status = "closed"
  end
end
