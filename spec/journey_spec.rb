require 'journey'

describe Journey do
  let :station {double(:station)}
  subject {Journey.new}

  describe "#record_journey" do
    it "should print out the list of journeys" do
      station_two = double(:station_two)
      subject.start (station)
      subject.finish (station_two)
      expect(subject.journeys[0].values).to include (station) and include (station_two)
    end

    it "should be empty when the card is created" do
      expect(subject.journeys).to be_empty
    end
  end
  describe "#in_journey?" do
    it "should return false when not on a journey" do
      expect(subject.in_journey?).to eq false
    end
  end
  describe "#start" do
    it "should start a journey" do
      subject.start (station)
      expect(subject.in_journey?).to eq true
    end
    it "should remember the station" do
      expect{subject.start(station)}.to change {subject.entry_station}.to eq station
    end
  end
  describe "#finish" do
    before do
      subject.start(station)
    end
    it "should end a journey" do
      subject.finish(station)
      expect(subject.in_journey?).to eq false
    end
    it "should forget entry station" do
      expect {subject.finish(station)}.to change {subject.entry_station}.to eq nil
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
  describe "#complete?" do
    it 'knows that a journey is complete' do
      subject.start(station)
      subject.finish(station)
      expect(subject).to be_complete
    end
    it 'knows that a journey is not complete' do
      subject.finish(station)
      expect(subject).to_not be_complete
    end
  end
end
