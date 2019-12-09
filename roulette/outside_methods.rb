# frozen_string_literal: true

require_relative 'roulette_table_layout'

module Roulette
  # InsideMethods has outside methods
  module OutsideMethods
    include RouletteTableLayout

    def write_option(lim)
      opt = -1
      while opt.to_i < 1 || opt.to_i > lim
        print "\noption? : "
        opt = gets.chomp
      end
      opt
    end

    def number_ranges
      write_bet
      odds = 2

      options = number_ranges_bins
      puts 'Choose an option...'
      print "1.- #{options[0]} \n2.- #{options[1]} \n3.- #{options[2]}"
      opt = write_option(3)

      run(options[opt.to_i - 1], odds)
    end

    def number_columns
      write_bet
      odds = 2

      options = number_column_bins
      puts 'Choose an option...'
      print "1.- #{options[0]} \n2.- #{options[1]} \n3.- #{options[2]}"
      opt = write_option(3)

      run(options[opt.to_i - 1], odds)
    end

    def low_high
      write_bet
      odds = 1

      options = low_high_bins
      puts 'Choose an option...'
      print "1.- Low: #{options[0]} \n2.- High: #{options[1]}"
      opt = write_option(2)

      run(options[opt.to_i - 1], odds)
    end

    def red_black
      write_bet
      odds = 1

      print "Choose an option...\n1.- Red \n2.- Black"
      opt = write_option(2)

      bins = red_black_bins(opt.to_i)
      run(bins, odds)
    end

    def odd_even
      write_bet
      odds = 1

      print "Choose an option...\n1.- Even \n2.- Odd"
      opt = write_option(2)

      bins = odd_even_bins(opt.to_i)
      run(bins, odds)
    end
  end
end
