require 'station'
describe Station do
  subject {Station.new("waterloo", :one)}
  describe "#initialize" do
    it "should have a name" do
      expect(subject.name).to eq "waterloo"
    end
    it "should have a zone" do
      expect(subject.zone).to eq :one
    end
  end



end
