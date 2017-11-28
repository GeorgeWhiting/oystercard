require 'journey'

describe Journey do

  let :station {double(:station)}
  subject {Journey.new}

  describe "#fare" do
    it "should return minimum fare when the journey is complete" do
      subject.start(station)
      subject.finish(station)
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end
    it "should return penalty fare when the journey is incomplete" do
      subject.start(station)
      subject.start(station)
      expect(subject.fare).to eq 6
    end
  end

  describe "#in_journey?" do

  end
  describe "#start" do
    it "should remember the station" do
      expect{subject.start(station)}.to change {subject.entry_station}.to eq station
    end
  end
  describe "#finish" do
    before do
      subject.start(station)
    end
  end
  describe "#entry_station" do
    before do
      subject.start(station)
    end
    it "returns the entry station" do
      expect(subject.entry_station).to eq station
    end
  end
end
