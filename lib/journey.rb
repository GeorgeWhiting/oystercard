require_relative 'station'
require_relative 'oystercard'
class Journey
attr_accessor :entry_station, :exit_station
  MINIMUM_FARE  = 1

  def start station
    self.entry_station = station
  end

  def finish station
    self.exit_station = station
  end

  def fare
    complete? ? MINIMUM_FARE : 6
  end

  def complete?
    entry_station && exit_station
  end
end
