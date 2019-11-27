require_relative 'roulette'

BETS = [ 'straight_bet', 'split_bet', 'street_bet', 'comer_bet', 'bet_of_five_numbers', 'line_bet',
         'number_ranges', 'number_columns', 'low_high', 'red_black', 'odd_even' ]

p 'Roulette Gambling'
p 'NOTE: The initial budget will be $1,000 dollars if you do not type one'
print 'Initial budget: '
initial_budget = gets.chomp.to_i
initial_budget = initial_budget.zero? ? 1000 : initial_budget

if initial_budget >= 5
  print "\n Do you want default bet of $5? (Y/N): "
  default_bet_str = gets.chomp

  if default_bet_str.downcase != 'n'
    default_bet_str = 'Y'
    default_bet = 5
  else
    default_bet = 0
  end
end

roulette = Roulette::BettingMethods.new(initial_budget, default_bet)

opt = ''
while(opt.downcase != 'quit')
  puts "Your earnings: #{roulette.earnings} \t Your losses: - #{roulette.losses} \t Budget: #{roulette.budget}"
  roulette.bettings
  opt = gets.chomp

  roulette.public_send(BETS[opt.to_i-1]) if opt.downcase != 'quit'
end
