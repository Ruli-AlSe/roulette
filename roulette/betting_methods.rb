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

    def line_bet
      write_bet
      odds = 5

      bin1 = '0'
      while(bin1.to_i < 1)
        print "\nfirst bin? : "
        bin1 = gets.chomp
      end

      line = ROULETTE_TABLE[get_row_col(bin1.to_i).first]
      print "FIRST LINE: #{line}"
      options = line_bet_bins(bin1.to_i)

      if options.count == 3
        opt = ''
        puts "\nChoose an option... \n1.- #{options[1]} \n2.- #{options[2]}"
        while(opt.to_i != 1 && opt.to_i != 2)
          print "\nsecond bin? : "
          opt = gets.chomp
        end
      else
        opt = '1'
      end

      bins = line + options[opt.to_i]

      print "\nYour line numbers are: #{bins.sort.inspect}\n"
      run(bins, odds)
    end

    def number_ranges
      write_bet
      odds = 2

      options = number_ranges_bins
      puts "Choose an option..."
      print "1.- #{options[0]} \n2.- #{options[1]} \n3.- #{options[2]}"

      opt = -1
      while(opt.to_i < 1 || opt.to_i > 3)
        print "\noption? : "
        opt = gets.chomp
      end

      run(options[opt.to_i-1], odds)
    end

    def number_columns
      write_bet
      odds = 2

      options = number_column_bins
      puts "Choose an option..."
      print "1.- #{options[0]} \n2.- #{options[1]} \n3.- #{options[2]}"

      opt = -1
      while(opt.to_i < 1 || opt.to_i > 3)
        print "\noption? : "
        opt = gets.chomp
      end

      run(options[opt.to_i-1], odds)
    end

    def low_high
      write_bet
      odds = 1

      options = low_high_bins
      puts "Choose an option..."
      print "1.- Low: #{options[0]} \n2.- High: #{options[1]}"

      opt = -1
      while(opt.to_i != 1 && opt.to_i != 2)
        print "\noption? : "
        opt = gets.chomp
      end

      run(options[opt.to_i-1], odds)
    end

    def red_black
      write_bet
      odds = 1

      puts "Choose an option..."
      print "1.- Red (r/R) \n2.- Black (b/B)"

      opt = ''
      while(opt.downcase != 'b' && opt.downcase != 'r')
        print "\noption? : "
        opt = gets.chomp
      end

      bins = red_black_bins(opt.downcase)

      run(bins, odds)
    end

    def odd_even
      write_bet
      odds = 1

      puts "Choose an option..."
      print "1.- Even (e/E) \n2.- Odd (o/O)"

      opt = ''
      while(opt.downcase != 'e' && opt.downcase != 'o')
        print "\noption? : "
        opt = gets.chomp
      end

      bins = odd_even_bins(opt.downcase)

      run(bins, odds)
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