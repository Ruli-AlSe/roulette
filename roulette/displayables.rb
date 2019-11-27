module Roulette
  module Displayables

    def bettings
      puts "\n INSIDE BETS\n"
      puts "\t 1.- Straight bet\n"
      puts "\t 2.- Split bet\n"
      puts "\t 3.- Street bet\n"
      puts "\t 4.- Comer bet\n"
      puts "\t 5.- Bet of five numbers\n"
      puts "\t 6.- Line bet\n"

      puts "\n OUTSIDE BETS\n"
      puts "\t 7.- 12-number ranges\n"
      puts "\t 8.- 12-number columns\n"
      puts "\t 9.- Low or High\n"
      puts "\t 10.- Color\n"
      puts "\t 11.- Odd or Even\n"

      puts "\n BETTING STRATEGIES\n"
      puts "\t 15.- Martingale\n"
      puts "\t 16.- Waiting\n"
      puts "\t 17.- 1-3-2-6 System\n"
      puts "\t 18.- Cancellation\n"

      puts "\nTo skip the game write: Quit\n"

      print "\n --------------------- Choose one: "
    end
  end
end