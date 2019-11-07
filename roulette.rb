class Roulette
  def initialize(budget, def_bet=0)
    @budget = budget
    @def_bet = def_bet
  end

  def straight_bet
    puts "Which bin?: "
    bin = gets.chomp
    run if bin == '00'
    if bin.to_i.positive?
      bin = bin.to_i > 36 ? 36 : bin
    else
      bin = 0
    end
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

  def run
  end
end