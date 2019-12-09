# frozen_string_literal: true

require_relative 'outside_methods'
require_relative 'displayables'

module Roulette
  # BettingStrategies is in charge to play roulette with strategies
  module BettingStrategies
    include OutsideMethods
    include Displayables

    def martingale
      opt = 0
      while opt.to_i.zero? || opt.to_i > 5
        print "Choose one bet\n"
        outside_bets(1)
        print "\n --------------------- Choose one: "
        opt = gets.chomp
      end

      selector(opt.to_i)
    end

    def selector(opt)
      case opt
      when 1 then number_ranges
      when 2 then number_columns
      when 3 then low_high
      when 4 then red_black
      when 5 then odd_even
      end
    end
  end
end
