require_relative 'journeylog'
class Oystercard
  DEFAULT_STARTING_BALANCE = 0
  DEFAULT_LIMIT = 90
  DEFAULT_MINIMUM = 1
  attr_reader :balance

  def initialize(journeylog = Journeylog.new)
    @balance = DEFAULT_STARTING_BALANCE
    @journeylog = journeylog
  end

  def top_up amount
  	raise "Max £#{DEFAULT_LIMIT}, fool" if too_much? amount
  	@balance += amount
  end

  def touch_in station
    raise "Not enough pennies, poor Baggins-McGee" if not_enough?
    deduct @journeylog.start(station)
  end

  def touch_out station
    deduct @journeylog.finish(station)
  end

  def return_journeys
    @journeylog.return_journeys
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
