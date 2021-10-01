
class JourneyLog
  attr_reader :journey_class

  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @journey_history = []
  end

  def fare
    @journey_class.fare
  end

  def start(station)
    @journey_class.entry_station(station)
  end

  def stop(station)
    @journey_class.exit_station(station)
  end

  def complete
    @journey_history << @journey_class.journey
  end

end