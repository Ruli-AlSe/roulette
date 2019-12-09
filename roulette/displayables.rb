# frozen_string_literal: true

module Roulette
  # Displayables is in charge of the parts displayables
  module Displayables
    def bettings
      inside_bets(1)
      outside_bets(7)
      betting_strategies(12)
      puts "\nTo skip the game write: Quit\n"

      print "\n --------------------- Choose one: "
    end

    def inside_bets(idx)
      puts "\n INSIDE BETS\n"
      puts "\t #{idx}.- Straight bet\n"
      puts "\t #{idx + 1}.- Split bet\n"
      puts "\t #{idx + 2}.- Street bet\n"
      puts "\t #{idx + 3}.- Comer bet\n"
      puts "\t #{idx + 4}.- Bet of five numbers\n"
      puts "\t #{idx + 5}.- Line bet\n"
    end

    def outside_bets(idx)
      puts "\n OUTSIDE BETS\n"
      puts "\t #{idx}.- 12-number ranges\n"
      puts "\t #{idx + 1}.- 12-number columns\n"
      puts "\t #{idx + 2}.- Low or High\n"
      puts "\t #{idx + 3}.- Color\n"
      puts "\t #{idx + 4}.- Odd or Even\n"
    end

    def betting_strategies(idx)
      puts "\n BETTING STRATEGIES\n"
      puts "\t #{idx}.- Martingale\n"
      puts "\t #{idx + 1}.- Waiting\n"
      puts "\t #{idx + 2}.- 1-3-2-6 System\n"
      puts "\t #{idx + 3}.- Cancellation\n"
    end

    def help_straight_bet
      puts "\n-------------------------------------------------------------------------------------"
      puts 'A ‘straight bet’ is a bet on a single number. There are 38 possible bets, and they'
      puts 'pay odds of 35 to 1. Each bin on the wheel pays one of the straight bets'
      puts "\n-------------------------------------------------------------------------------------"
    end

    def help_split_bet
      puts "\n-------------------------------------------------------------------------------------"
      puts 'A ‘split bet’ is a bet on an adjacent pair of numbers. It pays 17:1. The table'
      puts 'layout has the numbers arranged sequentially in three columns and twelve rows.'
      puts 'Adjacent numbers are in the same row or column'
      puts "\n-------------------------------------------------------------------------------------"
    end

    def help_street_bet
      puts "\n-------------------------------------------------------------------------------------"
      puts 'A ‘street bet’ includes the three numbers in a single now, which pays 11:1. There'
      puts 'are twelve of these bets on the table. Any of the three bins make a street bet'
      puts 'a winner.'
      puts "\n-------------------------------------------------------------------------------------"
    end

    def help_comer_bet
      puts "\n-------------------------------------------------------------------------------------"
      puts 'A square of four numbers is called a ‘comer bet’ and pays 8:1. There are 22 of these'
      puts 'bets available.'
      puts "\n-------------------------------------------------------------------------------------"
    end

    def help_bet_of_five_numbers
      puts "\n-------------------------------------------------------------------------------------"
      puts 'At one end of the layout, it is possible to place a bet on the Five numbers 0, 00,'
      puts '1, 2 and 3. This pays 6:1. It is the only combination bet that include 0 or 00.'
      puts "\n-------------------------------------------------------------------------------------"
    end

    def help_line_bet
      puts "\n-------------------------------------------------------------------------------------"
      puts 'A ‘line bet’ is a six number block, which pays 5:1. It is essentially two adjacent'
      puts 'street bets. There are 11 such combinations.'
      puts "\n-------------------------------------------------------------------------------------"
    end

    def help_number_ranges
      puts "\n-------------------------------------------------------------------------------------"
      puts 'Any of the three 12-number ranges (1-12, 13-24, 25-36) pays 2:1. There are just'
      puts 'three of these bets.'
      puts "\n-------------------------------------------------------------------------------------"
    end

    def help_number_columns
      puts "\n-------------------------------------------------------------------------------------"
      puts 'The layout offers the three 12-number columns at 2:1 odds. All of the numbers in'
      puts 'a given column have the same remainder when divided by three. '
      puts "\n-------------------------------------------------------------------------------------"
    end

    def help_low_high
      puts "\n-------------------------------------------------------------------------------------"
      puts 'There are two 18-number ranges 1-18 is called low, 19-36 is called high.'
      puts 'There are called even money bets because they pay at 1:1 odds.'
      puts "\n-------------------------------------------------------------------------------------"
    end

    def help_red_black
      puts "\n-------------------------------------------------------------------------------------"
      puts 'The individual numbers are colored red or black in an arbitrary pattern. Note that'
      puts '0 and 00 are colored green. The bets on red or black are even money bets,'
      puts 'which pay at 1:1 odds.'
      puts "\n-------------------------------------------------------------------------------------"
    end

    def help_odd_even
      puts "\n-------------------------------------------------------------------------------------"
      puts 'The numbers (other than 0 and 00) are also either even or odd.'
      puts "\n-------------------------------------------------------------------------------------"
    end
  end
end
