# frozen_string_literal: true

require 'colorize'
module Roulette
  # Displayables is in charge of the parts displayables
  module Displayables
    def bettings
      inside_bets(1)
      outside_bets(7)
      betting_strategies(12)
      puts "\nTo skip the game write: Quit\n".yellow

      print "\n --------------------- Choose one: ".white
    end

    def inside_bets(idx)
      puts "\n INSIDE BETS\n".bold.green
      puts "\t #{idx}.- Straight bet".green
      puts "\t #{idx + 1}.- Split bet".green
      puts "\t #{idx + 2}.- Street bet".green
      puts "\t #{idx + 3}.- Comer bet".green
      puts "\t #{idx + 4}.- Bet of five numbers".green
      puts "\t #{idx + 5}.- Line bet".green
    end

    def outside_bets(idx)
      puts "\n OUTSIDE BETS\n".bold.green
      puts "\t #{idx}.- 12-number ranges".green
      puts "\t #{idx + 1}.- 12-number columns".green
      puts "\t #{idx + 2}.- Low or High".green
      puts "\t #{idx + 3}.- Color".green
      puts "\t #{idx + 4}.- Odd or Even".green
    end

    def betting_strategies(idx)
      puts "\n BETTING STRATEGIES\n".bold.yellow
      puts "\t #{idx}.- Martingale".yellow
      puts "\t #{idx + 1}.- Waiting".yellow
      puts "\t #{idx + 2}.- 1-3-2-6 System".yellow
      puts "\t #{idx + 3}.- Cancellation".yellow
    end

    def help_straight_bet
      puts "\n------------------------------------------------------------------------------".yellow
      puts 'A ‘straight bet’ is a bet on a single number. There are 38 possible bets, and'.yellow
      puts 'they pay odds of 35 to 1. Each bin on the wheel pays one of the straight bets'.yellow
      puts "\n------------------------------------------------------------------------------".yellow
    end

    def help_split_bet
      puts "\n------------------------------------------------------------------------------".yellow
      puts 'A ‘split bet’ is a bet on an adjacent pair of numbers. It pays 17:1. The table'.yellow
      puts 'layout has the numbers arranged sequentially in three columns and twelve rows.'.yellow
      puts 'Adjacent numbers are in the same row or column'.yellow
      puts "\n------------------------------------------------------------------------------".yellow
    end

    def help_street_bet
      puts "\n------------------------------------------------------------------------------".yellow
      puts 'A ‘street bet’ includes the three numbers in a single now, which pays 11:1.'.yellow
      puts 'There are twelve of these bets on the table. Any of the three bins make a'.yellow
      puts 'street bet a winner.'.yellow
      puts "\n------------------------------------------------------------------------------".yellow
    end

    def help_comer_bet
      puts "\n------------------------------------------------------------------------------".yellow
      puts 'A square of four numbers is called a ‘comer bet’ and pays 8:1. There are 22 of'.yellow
      puts 'these bets available.'.yellow
      puts "\n------------------------------------------------------------------------------".yellow
    end

    def help_bet_of_five_numbers
      puts "\n------------------------------------------------------------------------------".yellow
      puts 'At one end of the layout, it is possible to place a bet on the Five numbers'.yellow
      puts '0, 00, 1, 2 and 3. This pays 6:1. It is the only combination bet that'.yellow
      puts 'include 0 or 00.'.yellow
      puts "\n------------------------------------------------------------------------------".yellow
    end

    def help_line_bet
      puts "\n------------------------------------------------------------------------------".yellow
      puts 'A ‘line bet’ is a six number block, which pays 5:1. It is essentially two'.yellow
      puts 'adjacent street bets. There are 11 such combinations.'.yellow
      puts "\n------------------------------------------------------------------------------".yellow
    end

    def help_number_ranges
      puts "\n------------------------------------------------------------------------------".yellow
      puts 'Any of the three 12-number ranges (1-12, 13-24, 25-36) pays 2:1. There are'.yellow
      puts 'just three of these bets.'.yellow
      puts "\n------------------------------------------------------------------------------".yellow
    end

    def help_number_columns
      puts "\n------------------------------------------------------------------------------".yellow
      puts 'The layout offers the three 12-number columns at 2:1 odds. All of the numbers'.yellow
      puts 'in a given column have the same remainder when divided by three. '.yellow
      puts "\n------------------------------------------------------------------------------".yellow
    end

    def help_low_high
      puts "\n------------------------------------------------------------------------------".yellow
      puts 'There are two 18-number ranges 1-18 is called low, 19-36 is called high.'.yellow
      puts 'There are called even money bets because they pay at 1:1 odds.'.yellow
      puts "\n------------------------------------------------------------------------------".yellow
    end

    def help_red_black
      puts "\n------------------------------------------------------------------------------".yellow
      puts 'The individual numbers are colored red or black in an arbitrary pattern. Note'.yellow
      puts 'that 0 and 00 are colored green. The bets on red or black are even money bets,'.yellow
      puts 'which pay at 1:1 odds.'.yellow
      puts "\n------------------------------------------------------------------------------".yellow
    end

    def help_odd_even
      puts "\n------------------------------------------------------------------------------".yellow
      puts 'The numbers (other than 0 and 00) are also either even or odd.'.yellow
      puts "\n------------------------------------------------------------------------------".yellow
    end
  end
end
