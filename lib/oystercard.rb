require_relative 'station'
require_relative 'journey'
class Oystercard
  DEFAULT_STARTING_BALANCE = 0
  DEFAULT_LIMIT = 90
  DEFAULT_MINIMUM = 1
  attr_reader :balance, :journey, :journeys
  attr_accessor :entry_station, :exit_station

  def initialize(journey = Journey.new)
    @balance = DEFAULT_STARTING_BALANCE
    @journeys = []
    @journey = journey
  end

  def top_up amount
  	raise "Max £#{DEFAULT_LIMIT}, fool" if too_much? amount
  	@balance += amount
  end

  def touch_in station
    finish_deduct_record(nil) if in_journey?
    start_new_journey(station)
  end

  def touch_out station
    finish_deduct_record station
  end

  def start_new_journey station
    raise "Not enough pennies, poor Baggins-McGee" if not_enough?
    journey.start station
  end

  def finish_deduct_record station
    journey.finish station
    deduct(journey.fare)
    record_journey
  end

  def record_journey
    journeys << journey
    @journey = Journey.new
  end

  def in_journey?
    journey.entry_station ? true : false
  end

  def deduct amount
    @balance -= amount
  end

  private



  def too_much? amount
    @balance + amount > DEFAULT_LIMIT
  end

  def not_enough?
  	@balance < DEFAULT_MINIMUM
  end

end
