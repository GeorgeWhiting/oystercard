class Journeylog

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start station
   @journey = current_journey
   fare = in_journey? ? @journey.fare : 0
   record_journey
   @journey.start station
   fare
  end

  def finish station
    @journey.finish station
    fare = @journey.fare
    @journey = current_journey
    fare
  end

  def current_journey
    if !@journey || @journey.complete?
      @journey_class.new
    else
      @journey.clone
    end
  end

  def return_journeys
    @journeys
  end

  def record_journey
    @journeys << @journey
  end

  def in_journey?
    @journey.entry_station ? true : false
  end
end
