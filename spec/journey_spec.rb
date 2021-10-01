require 'oystercard'

describe Journey do

  let(:no_journey) { { :entry_station => 0 , :exit_station => 0 } }
  let(:entry_station) { double :station}
  let(:exit_station) { double :station}

  it 'is initially not in journey' do 
    expect(subject.journey).to eq(no_journey)
  end

  it 'gives a penalty fare' do
    expect(subject.fare).to eq(6)
  end

  it "calculates a journey fare" do
    subject.journey[:entry_station] = entry_station
    subject.journey[:exit_station] = exit_station
    expect(subject.fare).to eq(Oystercard::MINIMUM_CHARGE)
  end

end