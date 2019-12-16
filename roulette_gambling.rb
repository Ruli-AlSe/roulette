# frozen_string_literal: true

require_relative 'roulette'
require 'colorize'

BETS = %w[ straight_bet split_bet street_bet comer_bet bet_of_five_numbers
           line_bet number_ranges number_columns low_high red_black odd_even
           martingale ].freeze

puts '------------------------------ Roulette Gambling ------------------------------'.bold.white
puts "\n * NOTE: The initial budget will be $1,000 dollars if you do not type one".bold.white
print 'Initial budget: '.white
initial_budget = gets.chomp.to_i
initial_budget = initial_budget.zero? ? 1000 : initial_budget

if initial_budget >= 5
  print "\n Do you want default bet of $5? (Y/N): ".green
  default_bet_str = gets.chomp

  default_bet = default_bet_str.downcase != 'n' ? 5 : 0
end

roulette = Roulette::BettingMethods.new(initial_budget, default_bet)

opt = ''
while opt.downcase != 'quit'
  print "\n\nYour earnings: #{roulette.earnings}".bold.green
  print "\t Your losses: - #{roulette.losses}".bold.red
  print "\t Budget: #{roulette.budget}\n".bold.white
  roulette.bettings
  opt = gets.chomp

  if opt.match?(/^help/)
    opt = opt.split.last
    if opt.to_i.positive? && opt.to_i < 12
      roulette.public_send('help_' + BETS[opt.to_i - 1])
    else
      puts "\n\nWrite a correct number to help".bold.red
    end
  elsif opt.to_i.positive? && opt.to_i < 12
    roulette.public_send(BETS[opt.to_i - 1])
  elsif opt == 'quit'
    puts "\n\nGood bye! See you later...\n\n".bold.white
  else
    puts "\n\nInvalid option! Try again...\n\n".bold.red
  end
end
