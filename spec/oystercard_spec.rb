require 'oystercard'

describe Oystercard do
  subject {Oystercard.new}
  let :station {double(:station)}

  describe "#balance" do
    it "should return a balance" do
      expect(subject.balance).to be_instance_of(Integer)
    end
  end
  describe "#top_up" do
  	it "should accept a top up" do
  	  expect(subject.top_up(20)).to eq(Oystercard::DEFAULT_STARTING_BALANCE + 20)
  	end
  	it "should not be able to go above limit" do
  	  expect{subject.top_up(100)}.to raise_error("Max £#{Oystercard::DEFAULT_LIMIT}, fool")
  	end
  end

  describe "#touch_in" do
  	it "shouldn't start a journey when card has less than £#{Oystercard::DEFAULT_MINIMUM}" do
      10.times do
      	subject.touch_in(station)
      	subject.touch_out(station)
      end
      expect{subject.touch_in(station)}.to raise_error "Not enough pennies, poor Baggins-McGee"
  	end
  end
  describe "#touch_out(station)" do
  	before do
  	  subject.touch_in(station)
    end
  	it "should charge a journey fare" do
  		expect {subject.touch_out(station)}.to change {subject.balance}.by(-Oystercard::DEFAULT_MINIMUM)
  	end
  end
end
