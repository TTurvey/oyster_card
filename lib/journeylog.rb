
class JourneyLog
  attr_reader :journey_class

  def initialize(journey_class = Journey.new )
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @journey_class.journey[:entry_station] = station
  end

  def stop(station)
    @journey_class.journey[:exit_station] = station
  end

  def complete
    @journeys << @journey_class.journey
  end

end