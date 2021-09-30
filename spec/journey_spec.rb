require 'oystercard'

describe Journey do

  let(:journey) { Journey.new }

  it 'is initially not in journey' do 
    expect(journey.in_journey).to eq(false)
  end



end