class Oystercard
  DEFAULT_STARTING_BALANCE = 10
  DEFAULT_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = DEFAULT_STARTING_BALANCE
  end

  def top_up amount
  	raise "Max £#{DEFAULT_LIMIT}, fool" if too_much? amount
  	@balance += amount
  end

  private

  def too_much? amount
    @balance + amount > DEFAULT_LIMIT	
  end

end