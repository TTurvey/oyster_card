require 'oystercard'

describe Journey do

  let(:journey) { Journey.new }

  let(:no_journey) { { :entry_station => 0 , :exit_station => 0 } }

  it 'is initially not in journey' do 
    expect(journey.journey).to eq(no_journey)
  end

  it 'gives a penalty fare' do
    expect(journey.fare).to eq(6)
  end

end