# frozen_string_literal: true

require_relative 'roulette'

BETS = %w[ straight_bet split_bet street_bet comer_bet bet_of_five_numbers
           line_bet number_ranges number_columns low_high red_black odd_even
           martingale ].freeze

p 'Roulette Gambling'
p 'NOTE: The initial budget will be $1,000 dollars if you do not type one'
print 'Initial budget: '
initial_budget = gets.chomp.to_i
initial_budget = initial_budget.zero? ? 1000 : initial_budget

if initial_budget >= 5
  print "\n Do you want default bet of $5? (Y/N): "
  default_bet_str = gets.chomp

  default_bet = default_bet_str.downcase != 'n' ? 5 : 0
end

roulette = Roulette::BettingMethods.new(initial_budget, default_bet)

opt = ''
while opt.downcase != 'quit'
  puts "Your earnings: #{roulette.earnings}" \
       " \t Your losses: - #{roulette.losses} \t Budget: #{roulette.budget}"
  roulette.bettings
  opt = gets.chomp

  if opt.match?(/^help/)
    opt = opt.split.last
    if opt.to_i.positive? && opt.to_i < 11
      roulette.public_send('help_' + BETS[opt.to_i - 1])
    else
      puts 'Write a correct number to help'
    end
  elsif opt.to_i.positive? && opt.to_i < 11
    roulette.public_send(BETS[opt.to_i - 1])
  elsif opt == 'quit'
    puts "Good bye! See you later...\n\n"
  else
    puts "Invalid option! Try again...\n\n"
  end
end
