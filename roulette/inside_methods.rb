# frozen_string_literal: true

require_relative 'roulette_table_layout'
require 'colorize'

module Roulette
  # InsideMethods has inside methods
  module InsideMethods
    include RouletteTableLayout

    def straight_bet
      write_bet
      bin = write_bin
      return run([bin], odds) if bin == '00'

      bin = if bin.to_i.positive?
              bin.to_i > 36 ? '36' : bin
            else
              '0'
            end

      run([bin], 35)
    end

    def split_bet
      write_bet
      bin = write_bin

      bins = split_bet_bins(bin.to_i)

      print "Your adjacent numbers are: #{bins.inspect}\n".yellow
      run(bins, 17)
    end

    def street_bet
      write_bet
      bin = write_bin

      bin = '36' if bin.to_i > 36
      bins = street_bet_bins(bin.to_i)

      print "Your street numbers are: #{bins.inspect}\n".yellow
      run(bins, 11)
    end

    def comer_bet
      write_bet
      bin = write_bin

      bin = '36' if bin.to_i > 36
      bins = street_bet_bins(bin.to_i)

      print "Your street numbers are: #{bins.inspect}\n".yellow
      run(bins, 8)
    end

    def bet_of_five_numbers
      write_bet

      bins = ROULETTE_TABLE[0] + ROULETTE_TABLE[1]

      print "Your five numbers are: #{bins.inspect}\n".yellow
      run(bins, 6)
    end

    def line_bet
      write_bet
      bin1 = write_bin
      options, line = first_line_with_options(bin1.to_i)

      opt = options.count == 3 ? choose_option(options) : '1'
      bins = line + options[opt.to_i]

      print "\nYour line numbers are: #{bins.sort.inspect}\n".yellow
      run(bins, 5)
    end

    private

    def choose_option(options)
      puts "Your actual choice: #{options[0]}".yellow
      opt = ''
      while opt.to_i != 1 && opt.to_i != 2
        puts "\nChoose an option... \n1.- #{options[1]} \n2.- #{options[2]}".yellow
        print 'option?: '.yellow
        opt = gets.chomp
      end
      opt
    end

    def first_line_with_options(bin)
      options = line_bet_bins(bin)
      line = ROULETTE_TABLE[get_row_col(bin).first]
      [options, line]
    end

    def write_bin
      bin = '0'
      while bin.to_i < 1
        print "\nWrite bin: ".yellow
        bin = gets.chomp
      end
      bin = '36' if bin.to_i > 36
      bin
    end
  end
end
