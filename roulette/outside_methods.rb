require_relative 'roulette_table_layout'

module Roulette
  module OutsideMethods
    include RouletteTableLayout

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
  end
end
