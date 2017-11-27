require "./lib/oystercard"
p card = Oystercard.new
p card.balance
p card.top_up(20)
p card.balance