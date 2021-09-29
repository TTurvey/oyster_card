require 'oystercard'

describe Oystercard do
  let(:station){ double :station }

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'adds money to balance' do
    expect(subject.top_up).to eq(5)
  end

  it 'test that limit cannot be breached' do
    oyster = Oystercard.new
    card_limit = Oystercard::CARD_LIMIT
    18.times { oyster.top_up }
    expect { oyster.top_up }.to raise_error("Cannot topup. Limit reached of #{card_limit}.")
  end

  it 'deducts money from card' do
    oyster = Oystercard.new(80)
    expect(oyster.deduct).to eq(75)
  end

  it 'throws an error if money deducted from empty balance' do
    expect { subject.deduct }.to raise_error("No money to deduct.")
  end

  it 'is initially not in journey' do 
    expect(subject.in_journey).to eq(false)
  end

  it 'is in journey when touched in' do
    oyster = Oystercard.new
    oyster.top_up
    oyster.touch_in(station)
    expect(oyster.in_journey).to eq(true)
  end

  it 'is not in journey when touched out' do 
    oyster = Oystercard.new
    oyster.touch_in(station)
    oyster.touch_out
    expect(oyster.in_journey).to eq(false)
  end

  it 'does not touch in if balance if less than 1' do
    expect(subject.touch_in(station)).to eq("Insufficient funds. Touch in denied.")
  end 
  
  it 'stores the entry station' do
    subject.top_up
    subject.touch_in(station)
    expect(subject.entry_station).to eq(station)
  end




end

