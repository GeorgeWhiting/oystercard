require 'Journeylog'
describe Journeylog do

  let(:journey){ double( :journey, start: nil, finish: nil, entry_station: nil, fare: nil, complete?: nil) }
  let(:station){ double :station }
  let(:journey_class){ double(:journey_class, new: journey)}
  subject {described_class.new(journey_class)}

  describe "#start" do
    it "starts a journey" do
      expect(journey_class).to receive(:new)
      subject.start(station)
    end
  end
  describe "#finish" do
    it "finishes a journey" do
      subject.start(station)
      expect(journey).to receive(:finish).with(station)
      subject.finish(station)
    end
  end
  describe "#return_journeys" do
    it "return a list of journeys" do
      subject.start(station)
      subject.finish(station)
      expect(subject.return_journeys).to_not be_empty
    end
  end
  describe "#in_journey?" do
    it "should return true when on a journey" do
      allow(journey).to receive(:entry_station).and_return(true)
      subject.start(station)
      expect(subject.in_journey?).to eq true
    end
    it "should return false when not on a journey" do
      subject.start(station)
      subject.finish(station)
      expect(subject.in_journey?).to eq false
    end
  end


end
