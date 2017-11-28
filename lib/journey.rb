require_relative 'station'
require_relative 'oystercard'
class Journey
attr_accessor :entry_station, :exit_station
attr_reader :journeys
  MINIMUM_FARE  = 1
  def initialize
    @journeys = []
  end

  def start station
    entry_station.nil? ? self.entry_station = station : (exit_station = nil; record_journey)
  end

  def finish station
    exit_station.nil? ? self.exit_station = station : entry_station = nil
    record_journey
  end

  def reset_journey
    self.entry_station = nil
    self.exit_station = nil
  end

  def in_journey?
  	entry_station ? true : false
  end

  def record_journey
    journey = { :entry_station => @entry_station, :exit_station => exit_station }
    @journeys << journey
    reset_journey
  end

  def complete?
    !journeys.last.values.include? nil
  end

  def fare
    complete? ? MINIMUM_FARE : 6
  end
end
