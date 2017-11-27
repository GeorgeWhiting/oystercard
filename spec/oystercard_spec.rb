require 'oystercard'

describe Oystercard do
	subject {Oystercard.new}
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
  describe "#deduct" do
  	it "should deduct money" do
  	  expect(subject.deduct(5)).to eq(Oystercard::DEFAULT_STARTING_BALANCE - 5) 
  	end
  end
  describe "#in_journey?" do
  	it "should return false when not on a journey" do
  	  expect(subject.in_journey?).to eq false
  	end
  end
  describe "#touch_in" do
  	it "should start a journey" do
  	  subject.touch_in
  	  expect(subject.in_journey?).to eq true
  	end
  	it "shouldn't start a journey when card has less than £#{Oystercard::DEFAULT_MINIMUM}" do
      subject.deduct(10)
      expect{subject.touch_in}.to raise_error "Not enough pennies, poor Baggins-McGee"
  	end
  end
  describe "#touch_out" do
  	it "should end a journey" do
  	  subject.touch_in
  	  subject.touch_out
  	  expect(subject.in_journey?).to eq false
  	end
  end
end
