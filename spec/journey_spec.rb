require 'oystercard'

describe Journey do

  let(:journey) { Journey.new }

  it 'is initially not in journey' do 
    expect(journey.in_journey).to eq(false)
  end

  it 'gives a penalty fare' do
    expect(journey.fare).to eq(6)
  end



  

end