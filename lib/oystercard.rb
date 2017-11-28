require_relative 'station'
require_relative 'journey'
class Oystercard
  DEFAULT_STARTING_BALANCE = 10
  DEFAULT_LIMIT = 90
  DEFAULT_MINIMUM = 1
  attr_reader :balance, :entry_station, :journey

  def initialize(journey = Journey.new)
    @balance = DEFAULT_STARTING_BALANCE
    @journey = journey
  end

  def top_up amount
  	raise "Max £#{DEFAULT_LIMIT}, fool" if too_much? amount
  	@balance += amount
  end

  def touch_in station
  	raise "Not enough pennies, poor Baggins-McGee" if not_enough?
    @journey.start station
  end

  def touch_out station
  	@balance -= DEFAULT_MINIMUM
    @journey.finish station
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
