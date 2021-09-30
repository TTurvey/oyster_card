class Journey

  attr_reader :journey

  def initialize 
    @journey = { :entry_station => 0 , :exit_station => 0 }
    @in_journey = false
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

  def fare
    if @journey[:entry_station] != 0 && @journey[:exit_station] != 0
      Oystercard::MINIMUM_CHARGE
    else 
      6
    end
  end

end
