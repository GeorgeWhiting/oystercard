class Oystercard
  DEFAULT_STARTING_BALANCE = 10
  DEFAULT_LIMIT = 90
  DEFAULT_MINIMUM = 1
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
  	raise "Not enough pennies, poor Baggins-McGee" if not_enough?
    @in_journey = true				
  end

  def touch_out
  	@balance -= DEFAULT_MINIMUM
  	@in_journey = false
  end

  def in_journey?
  	@in_journey
  end

  private

  def too_much? amount
    @balance + amount > DEFAULT_LIMIT	
  end

  def not_enough?
  	@balance < DEFAULT_MINIMUM
  end

end