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
  end
end
