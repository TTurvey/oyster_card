class Journey

  attr_reader :journey

  def initialize 
    @journey = { :entry_station => 0 , :exit_station => 0 }
  end

  def start(station)
    @journey[:entry_station] = station
  end

  def stop(station)
    @journey[:exit_station] = station
  end

  def fare
    if @journey[:entry_station] != 0 && @journey[:exit_station] != 0
      Oystercard::MINIMUM_CHARGE
    else 
      6
    end
  end

end
