class Journey

  attr_reader :journey

  def initialize 
    @journey = { :entry_station => 0 , :exit_station => 0 }
  end

  

  def fare
    if @journey[:entry_station] != 0 && @journey[:exit_station] != 0
      Oystercard::MINIMUM_CHARGE
    else 
      6
    end
  end

end
