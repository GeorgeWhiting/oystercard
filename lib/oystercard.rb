class Oystercard
  DEFAULT_STARTING_BALANCE = 10
  attr_reader :balance
  
  def initialize
    @balance = DEFAULT_STARTING_BALANCE
  end

end