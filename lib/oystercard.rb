class Oystercard
  DEFAULT_STARTING_BALANCE = 10
  DEFAULT_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = DEFAULT_STARTING_BALANCE
    @in_journey = false
  end

  def top_up amount
  	raise "Max £#{DEFAULT_LIMIT}, fool" if too_much? amount
  	@balance += amount
  end

  def deduct amount
  	@balance -= amount
  end

  def touch_in
    @in_journey = true				
  end

  def touch_out
  	@in_journey = false
  end

  def in_journey?
  	@in_journey
  end

  private

  def too_much? amount
    @balance + amount > DEFAULT_LIMIT	
  end

end