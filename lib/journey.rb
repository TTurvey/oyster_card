class Journey

  attr_accessor :journey

  def initialize 
    @journey = { :entry_station => 0 , :exit_station => 0 }
  end

  def fare
    if @journey[:entry_station] != 0 && @journey[:exit_station] != 0
      Oystercard::MINIMUM_CHARGE
    else 
      Oystercard::FINE_CHARGE
    end
  end

end
