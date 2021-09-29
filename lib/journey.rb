class Journey

  attr_reader :journey

  def initialize 
    @journey = { :entry_station => 0 , :exit_station => 0}
  end

  def start(station)
    @in_journey = true
    @journey[:entry_station] = station
  end

  def in_journey 
    @in_journey
  end

  def stop(station)
    @journey[:exit_station] = station
    
    @in_journey = false
  end

end