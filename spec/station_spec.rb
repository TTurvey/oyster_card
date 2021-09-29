require 'station'

describe Station do

  name_one = "Bank"
  zone_one = "Zone 1"
  let(:station) { Station.new(name_one, zone_one) }

  it "has a name" do
    expect(station.name).to eq name_one
  end

  it "has a zone" do
    expect(station.zone).to eq zone_one
  end
end
