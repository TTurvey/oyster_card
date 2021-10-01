class Journey

  attr_accessor :journey

  def initialize 
    @journey = { :entry_station => 0 , :exit_station => 0 }
  end

  def entry_station(station)
    @journey[:entry_station] = station
  end

  def exit_station(station)
    @journey[:exit_station] = station
  end

  def fare
    if @journey[:entry_station] != 0 && @journey[:exit_station] != 0
      Oystercard::MINIMUM_CHARGE
    else 
      Oystercard::FINE_CHARGE
    end
  end

end
