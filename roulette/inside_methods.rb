require_relative 'roulette_table_layout'

module Roulette
  module InsideMethods
    include RouletteTableLayout

    def straight_bet
      write_bet
      odds = 35

      print "\nWhich bin?: "
      bin = gets.chomp
      return run(bin) if bin == '00'

      if bin.to_i.positive?
        bin = bin.to_i > 36 ? '36' : bin
      else
        bin = '0'
      end

      run([bin], odds)
    end

    def split_bet
      write_bet
      odds = 17

      bin = '0'
      while(bin == '00' || bin == '0' || bin.to_i < 1)
        print "\nWhich bin?: "
        bin = gets.chomp
      end

      bin = '36' if bin.to_i > 36
      bins = split_bet_bins(bin.to_i)

      print "Your adjacent numbers are: #{bins.inspect}\n"
      run(bins, odds)
    end

    def street_bet
      write_bet
      odds = 11

      bin = '0'
      while(bin == '00' || bin == '0' || bin.to_i < 1)
        print "\nWhich bin? : "
        bin = gets.chomp
      end

      bin = '36' if bin.to_i > 36
      bins = street_bet_bins(bin.to_i)

      print "Your street numbers are: #{bins.inspect}\n"
      run(bins, odds)
    end

    def comer_bet
      write_bet
      odds = 8

      bin = '0'
      while(bin == '00' || bin == '0' || bin.to_i < 1)
        print "\nWhich bin? : "
        bin = gets.chomp
      end

      bin = '36' if bin.to_i > 36
      bins = street_bet_bins(bin.to_i)

      print "Your street numbers are: #{bins.inspect}\n"
      run(bins, odds)
    end

    def bet_of_five_numbers
      write_bet
      odds = 6

      bins = ROULETTE_TABLE[0] + ROULETTE_TABLE[1]

      print "Your five numbers are: #{bins.inspect}\n"
      run(bins, odds)
    end
  end
end
