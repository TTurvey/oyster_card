
class JourneyLog
  attr_reader :journey_object

  def initialize(journey_object = Journey.new )
    @journey_object = journey_object
    @journeys = []
  end

  def start(station)
    @journey_object.journey[:entry_station] = station
  end

  def stop(station)
    @journey_object.journey[:exit_station] = station
  end

  def complete
    @journeys <<  @journey_object.journey
  end

end