class Oystercard
CARD_LIMIT = 90
MINIMUM_CHARGE = 5
MINIMUM_BALANCE = 1
  attr_reader :balance, :journey_history
  attr_accessor :in_journey

  def initialize
    @balance = 0
    @in_journey = false
    @journey_history = []
    @journey = { :entry_station => 0 , :exit_station => 0}
  end

  def top_up(value)
    fail "Cannot topup. Limit reached of #{CARD_LIMIT}." if limit?(value)
    @balance += value
  end

  def limit?(value)
    @balance + value >= CARD_LIMIT
  end

  def deduct
    fail "No money to deduct." if empty?
    @balance -= MINIMUM_CHARGE
  end

  def empty?
    @balance == 0
  end

  def in_journey 
    @in_journey
  end

  def touch_in(station)
    fail "Insufficient funds. Touch in denied." unless sufficient_funds?
      
      @in_journey = true
      @journey[:entry_station] = station
  end

  def touch_out(station)
    deduct
    @in_journey = false
    @journey[:exit_station] = station
    @journey_history <<  @journey
  end

  def sufficient_funds?
    @balance >= MINIMUM_BALANCE
  end

end