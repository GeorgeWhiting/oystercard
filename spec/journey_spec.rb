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
    it "should be the pentalty fare by default" do
      expect(subject.fare).to eq 6
    end
  end
  describe "#complete?"do
    it "should return false when journey is incomplete" do
      expect(subject).to_not be_complete
    end
    it "knows when a journey is complete" do
      subject.start(station)
      subject.finish(station)
    end
  end
  describe "#finish" do
    before do
      subject.start(station)
      subject.finish(station)
    end
    it "should return the exit station" do
      expect(subject.exit_station).to eq station
    end
  end
  describe "#start" do
    it "should remember the station" do
      expect{subject.start(station)}.to change {subject.entry_station}.to eq station
    end
    it "returns the entry station" do
      subject.start(station)
      expect(subject.entry_station).to eq station
    end
  end
end
