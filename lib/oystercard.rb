require_relative 'station'
require_relative 'journey'

class Oystercard
CARD_LIMIT = 90
MINIMUM_CHARGE = 5
MINIMUM_BALANCE = 1
  attr_reader :balance, :journey_history, :journey, :journey_object

  def initialize(journey = Journey.new)
    @balance = 0
    @journey_history = []
    @journey_object = journey
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

  def touch_in(station)
    fail "Insufficient funds. Touch in denied." unless sufficient_funds?
      journey_object.start(station)
      @journey_object
  end

  def touch_out(station)
    deduct
    @journey_object.stop(station)
    @journey_history <<  @journey.journey
  end

  def sufficient_funds?
    @balance >= MINIMUM_BALANCE
  end

end