require_relative 'menu'
require_relative 'roulette'

BETS = [
  'straight_bet',
  'split_bet',
  'street_bet',
  'comer_bet',
  'bet_of_five_numbers',
  'line_bet',
  'number_ranges',
  'number_columns',
  'low',
  'high',
  'red',
  'black',
  'odd',
  'even'
]

p 'Roulette Gambling'

p 'NOTE: The initial budget will be $1,000 dollars if you do not type one'
p 'Initial budget: '
initial_budget = gets.chomp.to_i

initial_budget.zero? ? initial_budget = 1000 : initial_budget

if initial_budget >= 5
  print "\n Do you want default bet of $5? (Y/N)\n"
  default_bet_str = gets.chomp
  if default_bet_str.upcase != 'N'
    default_bet_str = 'Y'
    default_bet = 5
  end
end

menu = Menu.new()

opt = ''
roulette = Roulette.new(initial_budget, default_bet)

while(opt != 'quit')
  menu.betting_strategies
  opt = gets.chomp

  roulette.public_send(BETS[opt.to_i-1]) if opt != 'quit'
end
