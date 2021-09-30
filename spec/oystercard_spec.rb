require 'oystercard'

describe Oystercard do
  let(:station) { double :station }
  let(:oyster) { Oystercard.new }
  let(:entry_station) { double :station}
  let(:exit_station) { double :station}
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  it 'has a balance of zero' do
    expect(oyster.balance).to eq(0)
  end

  it 'adds money to balance' do
    expect(oyster.top_up(Oystercard::MINIMUM_CHARGE)).to eq(Oystercard::MINIMUM_CHARGE)
  end

  it 'test that limit cannot be breached' do
    card_limit = Oystercard::CARD_LIMIT
    expect { oyster.top_up(Oystercard::CARD_LIMIT) }.to raise_error("Cannot topup. Limit reached of #{card_limit}.")
  end

  it 'deducts money from card' do
    large_amount = 80
    oyster.top_up(large_amount)
    expect(oyster.deduct).to eq(large_amount - Oystercard::MINIMUM_CHARGE)
  end

  it 'throws an error if money deducted from empty balance' do
    expect { oyster.deduct }.to raise_error("No money to deduct.")
  end

  it 'is in journey when touched in' do
    oyster.top_up(Oystercard::MINIMUM_CHARGE)
    oyster.touch_in(station)
    journey_object = oyster.journey
    expect(journey_object.in_journey).to eq(true)
  end

  it 'is not in journey when touched out' do 
    oyster.top_up(Oystercard::MINIMUM_CHARGE)
    oyster.touch_in(station)
    journey_object = oyster.journey
    oyster.touch_out(station)
    expect(journey_object.in_journey).to eq(false)
  end

  it 'does not touch in if balance if less than 1' do
    expect { oyster.touch_in(station) }.to raise_error("Insufficient funds. Touch in denied.")
  end 

  it 'deducts fee from card on touch out' do
    oyster.top_up(Oystercard::MINIMUM_CHARGE)
    oyster.touch_in(station)
    expect{ oyster.touch_out(station) }.to change{ oyster.balance }.by(-Oystercard::MINIMUM_CHARGE)
  end

  it 'stores a journey' do
    oyster.top_up(Oystercard::MINIMUM_CHARGE)
    oyster.touch_in(entry_station)
    oyster.touch_out(exit_station)
    expect( oyster.journey_history).to include journey
  end

end

