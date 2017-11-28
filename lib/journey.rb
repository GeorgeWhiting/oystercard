require_relative 'station'
require_relative 'oystercard'
class Journey
attr_reader :entry_station, :journeys

  def initialize
    @journeys = []
  end

  def start station
    @entry_station = station
  end

  def finish station
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

end
