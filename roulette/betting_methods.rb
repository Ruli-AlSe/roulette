# frozen_string_literal: true

require_relative 'displayables'
require_relative 'inside_methods'
require_relative 'outside_methods'
require_relative 'betting_strategies'

module Roulette
  # BettingMethods build all types of methods and strategies for application
  class BettingMethods
    include Displayables
    include InsideMethods
    include OutsideMethods
    include BettingStrategies

    attr_reader :budget, :def_bet, :earnings, :losses

    def initialize(budget, def_bet)
      @budget = budget
      @def_bet = def_bet
      @earnings = 0
      @losses = 0
    end

    def write_bet
      while @def_bet.zero?
        print 'Write your bet: '.yellow
        @def_bet = gets.chomp.to_i

        @def_bet = if @def_bet.positive?
                     @def_bet > @budget ? 0 : @def_bet
                   else
                     0
                   end
      end
    end

    def run(bins, odds)
      puts "\n\n--------------------------- RUNNING... ---------------------------\n".bold.magenta
      row, col = get_row_col(rand(-1..37))
      rand_bin = ROULETTE_TABLE[row][col]
      puts "Roulette bin was: #{rand_bin} #{decode_color(COLOR_BINS[rand_bin])}".bold.magenta
      result(bins, rand_bin, odds)
    end

    def decode_color(val)
      return 'Red' if val == 'r'
      return 'Black' if val == 'b'

      'Green'
    end

    def result(bins, rand_bin, odds)
      if bins.include?(rand_bin)
        @earnings += @def_bet + @def_bet * odds
        @budget += @def_bet + @def_bet * odds
      else
        @losses += @def_bet
        @budget -= @def_bet
      end
    end
  end
end
