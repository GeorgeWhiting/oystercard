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
  	  expect(subject.top_up(20)).to eq(30)
  	end
  	it "should not be able to go above limit" do
  	  expect{subject.top_up(100)}.to raise_error("Max £#{Oystercard::DEFAULT_LIMIT}, fool")
  	end
  end
end
