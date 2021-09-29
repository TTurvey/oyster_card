class Oystercard
CARD_LIMIT = 90
MINIMUM_CHARGE = 5
MINIMUM_BALANCE = 1
  attr_reader :balance, :entry_station
  attr_accessor :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    fail "Cannot topup. Limit reached of #{CARD_LIMIT}." if limit?(value)
    @balance += value
  end

  def limit?(value)
    @balance + value > CARD_LIMIT
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
    if sufficient_funds?
      @entry_station = station
      @in_journey = true
    else
      "Insufficient funds. Touch in denied."
    end
  end

  def touch_out 
    deduct
    @in_journey = false
  end

  def sufficient_funds?
    @balance >= MINIMUM_BALANCE
  end

end