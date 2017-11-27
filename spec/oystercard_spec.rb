require 'oystercard'

describe Oystercard do
	subject {Oystercard.new}
  describe "#balance" do
    it "should return a balance" do
      expect(subject.balance).to be_instance_of(Integer)
    end
  end
end
