require 'oystercard'

describe Oystercard do

  let(:station) { double :station }
  let(:oyster) { Oystercard.new }
  let(:entry_station) { double :station}
  let(:exit_station) { double :station}

  it 'has a balance of zero' do
    expect(oyster.balance).to eq(Oystercard::STARTING_BALANCE)
  end

  describe '#top_up' do
    it 'adds money to balance' do
      expect(oyster.top_up(Oystercard::MINIMUM_CHARGE)).to eq(Oystercard::MINIMUM_CHARGE)
    end

    it 'has a maximum limit' do
      card_limit = Oystercard::CARD_LIMIT
      expect { oyster.top_up(card_limit) }.to raise_error("Cannot topup. Limit reached of #{card_limit}.")
    end
  end

  describe '#deduct' do
    it 'deducts money from card' do
      journeylog = double("Journey Log Class")
      expect(journeylog).to receive(:fare).and_return(Oystercard::MINIMUM_CHARGE)

      oyster = Oystercard.new(journeylog) 
      large_amount = Oystercard::CARD_LIMIT - Oystercard::MINIMUM_BALANCE
      oyster.top_up(large_amount)
      oyster.deduct
    end

    it 'throws an error if money deducted from empty balance' do
      expect { oyster.deduct }.to raise_error("No money to deduct.")
    end
  end


  describe '#touch_in' do

    it 'has an initial station when touched in' do
      journeylog = double("Journey Log Class")
      oyster = Oystercard.new(journeylog)
      expect(journeylog).to receive(:start).with(station) 
      
      oyster.top_up(Oystercard::MINIMUM_CHARGE)
      oyster.touch_in(station, station)
    end

    it 'does not touch in if balance if less than 1' do
      expect { oyster.touch_in(station, station) }.to raise_error("Insufficient funds. Touch in denied.")
    end 

  end

  describe '#touch_out' do
    it 'touches out' do 
      journeylog = double("Journey Log Class")
      oyster = Oystercard.new(journeylog)
      expect(journeylog).to receive(:fare).and_return(Oystercard::MINIMUM_CHARGE)
      expect(journeylog).to receive(:stop).with(station) 
      expect(journeylog).to receive(:complete)

      oyster.top_up(Oystercard::MINIMUM_CHARGE)
      oyster.touch_out(station, station)
    end
  end
end
