require_relative 'station'
require_relative 'journey'
require_relative 'journeylog'

class Oystercard
CARD_LIMIT = 90
MINIMUM_CHARGE = 5
FINE_CHARGE = 6
MINIMUM_BALANCE = 1
STARTING_BALANCE = 0

  attr_reader :balance
  attr_reader :journey_class
  attr_reader :journeylog_class, :journey_history

  def initialize(journeylog_class = JourneyLog.new)
    @balance = STARTING_BALANCE
    @journey_history = []
    @journeylog_class = journeylog_class
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
    @balance -= @journeylog_class.fare
  end

  def empty?
    @balance == 0
  end

  def touch_in(name, station = Station.new(name))
    fail "Insufficient funds. Touch in denied." unless sufficient_funds?
      journeylog_class.start(station)
  end

  def touch_out(name, station = Station.new(name))
    @journeylog_class.stop(station)
    deduct
    @journeylog_class.complete
  end

  def sufficient_funds?
    @balance >= MINIMUM_BALANCE
  end

end