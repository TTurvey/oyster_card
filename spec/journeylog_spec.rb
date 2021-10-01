require 'journeylog'


describe JourneyLog do

  let(:station) {double :station}

  describe 'fare' do
    it 'calculates fare' do
      journey_double = double("Journey Class")
      journey = JourneyLog.new(journey_double)
      expect(journey).to receive(:fare)

      journey.fare
    end
  end

  describe 'start' do
    it 'takes a station' do
      journey_double = double("Journey Class")
      journey = JourneyLog.new(journey_double)
      expect(journey).to receive(:start).with(station)

      journey.start(station)
    end
  end

  describe 'stop' do
    it 'takes a station' do
      journey_double = double("Journey Class")
      journey = JourneyLog.new(journey_double)
      expect(journey).to receive(:stop).with(station)

      journey.stop(station)
    end
  end
end
