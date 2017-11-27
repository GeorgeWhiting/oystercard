require "./lib/oystercard"
p card = Oystercard.new
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