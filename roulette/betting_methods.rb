require_relative 'roulette_table_layout'

module Roulette
  class BettingMethods
    include RouletteTableLayout

    attr_reader :budget, :def_bet, :earnings, :losses

    ROULETTE_BIN = { '1': 'r', '3': 'r', '5': 'r', '9': 'r', '10': 'b', '12': 'r', '13': 'b',
                    '14': 'r', '16': 'r', '17': 'b', '20': 'b', '21': 'r', '25': 'r', '26': 'b',
                    '28': 'b', '30': 'r', '00': 'g', '0': 'g', '31': 'b', '32': 'r', '33': 'b',
                    '34': 'r', '35': 'b', '36': 'r', '2': 'b', '4': 'b', '6': 'b', '7': 'r',
                    '8': 'b', '11': 'b', '15': 'b', '18': 'r', '19': 'r', '22': 'b', '23': 'r',
                    '24': 'b', '27': 'r','29': 'b' }

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

      run(bin, odds)
    end

    def split_bet
      puts "we are on split bet"
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

    def run(bin, odds)
      puts '----------- RUNNING... -----------'
      rand_bin = ROULETTE_BIN.to_a[rand(0..37)]
      puts "----------- Roulette bin was: #{rand_bin.first} #{decode_color(rand_bin.last)}"
      result(bin, rand_bin, odds)
    end

    def decode_color(val)
      return 'Red' if val == 'r'
      return 'Black' if val == 'b'
      'Green'
    end

    def result(bin, rand_bin, odds)
      if bin == rand_bin.first
        @earnings += @def_bet + @def_bet*odds
        @budget += @def_bet + @def_bet*odds
      else
        @losses += @def_bet
        @budget -= @def_bet
      end
    end
  end
end