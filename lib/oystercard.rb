class Oystercard
  DEFAULT_STARTING_BALANCE = 10
  DEFAULT_LIMIT = 90
  DEFAULT_MINIMUM = 1
  attr_reader :balance, :entry_station, :journeys

  def initialize
    @balance = DEFAULT_STARTING_BALANCE
    @journeys = []
  end

  def top_up amount
  	raise "Max £#{DEFAULT_LIMIT}, fool" if too_much? amount
  	@balance += amount
  end

  def touch_in station
  	raise "Not enough pennies, poor Baggins-McGee" if not_enough?
  	@entry_station = station
  end

  def touch_out station
  	@balance -= DEFAULT_MINIMUM
    record_journey station
    @entry_station = nil
  end

  def in_journey?
  	@entry_station ? true : false
  end

  def record_journey station
    journey = { :entry_station => @entry_station, :exit_station => station }
    @journeys << journey
  end

  private

  def deduct amount
  	@balance -= amount
  end

  def too_much? amount
    @balance + amount > DEFAULT_LIMIT
  end

  def not_enough?
  	@balance < DEFAULT_MINIMUM
  end

end
