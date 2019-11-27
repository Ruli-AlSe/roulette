require_relative 'roulette_table_layout'
require_relative 'displayables'

module Roulette
  class BettingMethods
    include RouletteTableLayout
    include Displayables

    attr_reader :budget, :def_bet, :earnings, :losses

    def initialize(budget, def_bet)
      @budget = budget
      @def_bet = def_bet
      @earnings = 0
      @losses = 0
    end

    def write_bet
      while(@def_bet == 0)
        print "Write your bet: "
        @def_bet = gets.chomp.to_i

        if @def_bet.positive?
          @def_bet = @def_bet > @budget ? 0 : @def_bet
        else
          @def_bet = 0
        end
      end
    end

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
      puts "we are on street bet"
    end

    def comer_bet
      puts "we are on comer bet"
    end

    def bet_of_five_numbers
      puts "we are on bet of five numbers"
    end

    def line_bet
      puts "we are on line bet"
    end

    def number_ranges
      puts "we are on number ranges"
    end

    def number_columns
      puts "we are on number columns"
    end

    def low
      puts "we are on low"
    end

    def high
      puts "we are on high"
    end

    def red
      puts "we are on red"
    end

    def black
      puts "we are on black"
    end

    def even
      puts "we are on even"
    end

    def odd
      puts "we are on odd"
    end

    def run(bins, odds)
      puts '----------- RUNNING... -----------'
      row, col = get_row_col(rand(-1..37))
      rand_bin = ROULETTE_TABLE[row][col]
      puts "----------- Roulette bin was: #{rand_bin} #{decode_color(COLOR_BINS[rand_bin])}"
      result(bins, rand_bin, odds)
    end

    def decode_color(val)
      return 'Red' if val == 'r'
      return 'Black' if val == 'b'
      'Green'
    end

    def result(bins, rand_bin, odds)
      if bins.include?(rand_bin)
        @earnings += @def_bet + @def_bet*odds
        @budget += @def_bet + @def_bet*odds
      else
        @losses += @def_bet
        @budget -= @def_bet
      end
    end
  end
end