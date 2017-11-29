require "./lib/oystercard"
require "./lib/station"
p card = Oystercard.new
p station = Station.new("waterloo", :two)
p station_two = Station.new("Bank", :one)
p card.balance
p card.top_up(20)
p card.balance
begin
	card.top_up(100)
rescue Exception => e
	p e.message
end
p card.balance
p card.deduct (15)
# p card.in_journey?
# p card.touch_in station
# p card.in_journey?
# p card.touch_out station
# p card.deduct (15)
# begin
# 	 card.touch_in station
# rescue Exception => e
# 	p e.message
# end
p card.top_up (20)
p card.touch_in station
p card.balance
p card.touch_out station_two

# p card.touch_in station
p card.touch_in station
# p card.balance
p card.touch_out station
p card.balance
p card.journeys
