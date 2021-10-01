require 'oystercard'

describe Journey do

  let(:no_journey) { { :entry_station => 0 , :exit_station => 0 } }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:station) { double :station }

  it 'is initially not in journey' do 
    expect(subject.journey).to eq(no_journey)
  end

  describe '#fare' do

    it 'gives a penalty fare' do
      expect(subject.fare).to eq(Oystercard::FINE_CHARGE)
    end

    it "calculates a journey fare" do
      subject.journey[:entry_station] = entry_station
      subject.journey[:exit_station] = exit_station
      expect(subject.fare).to eq(Oystercard::MINIMUM_CHARGE)
    end

  end

  describe '#entry_station' do

    it 'stores an entry station' do
      subject.entry_station(station)
      expect(subject.journey).to include :entry_station => station
    end
  end

  describe '#exit_station' do

    it 'stores an exit station' do
      subject.exit_station(station)
      expect(subject.journey).to include :exit_station => station
    end

  end

end