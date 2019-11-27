module Roulette
  module RouletteTableLayout
    COLOR_BINS = { '0' => 'g', '00' => 'g', '1' => 'r', '2' => 'b', '3' => 'r', '4' => 'b',
      '5' => 'r', '6' => 'b', '7' => 'r', '8' => 'b', '9' => 'r', '10' => 'b', '11' => 'b',
      '12' => 'r', '13' => 'b', '14' => 'r', '15' => 'b', '16' => 'r', '17' => 'b', '18' => 'r',
      '19' => 'r', '20' => 'b', '21' => 'r', '22' => 'b', '23' => 'r', '24' => 'b', '25' => 'r',
      '26' => 'b', '27' => 'r', '28' => 'b', '29' => 'b', '30' => 'r', '31' => 'b', '32' => 'r',
      '33' => 'b', '34' => 'r', '35' => 'b', '36' => 'r' }

    ROULETTE_TABLE = [ ['0', '00'],
                      ['1', '2', '3'],
                      ['4', '5', '6'],
                      ['7', '8', '9'],
                      ['10', '11', '12'],
                      ['13', '14', '15'],
                      ['16', '17', '18'],
                      ['19', '20', '21'],
                      ['22', '23', '24'],
                      ['25', '26', '27'],
                      ['28', '29', '30'],
                      ['31', '32', '33'],
                      ['34', '35', '36'] ]

    def split_bet_bins(bin)
      row, col = get_row_col(bin)
      array_bins = [ ROULETTE_TABLE[row][col] ]
      array_bins.append( ROULETTE_TABLE[row-1][col] ) if valid_position?(row-1, col)
      array_bins.append( ROULETTE_TABLE[row+1][col] ) if valid_position?(row+1, col)
      array_bins.append( ROULETTE_TABLE[row][col-1] ) if valid_position?(row, col-1)
      array_bins.append( ROULETTE_TABLE[row][col+1] ) if valid_position?(row, col+1)
      array_bins
    end

    def street_bet_bins(bin)
      row = get_row_col(bin)
      array_bins = ROULETTE_TABLE[row.first]
    end

    def line_bet_bins(bin)
      row = get_row_col(bin)
      array_bins = [ROULETTE_TABLE[row.first]]
      array_bins.append( ROULETTE_TABLE[row.first-1] ) if valid_position?(row.first-1)
      array_bins.append( ROULETTE_TABLE[row.first+1] ) if valid_position?(row.first+1)
      array_bins
    end

    def number_ranges_bins
      array_bins = []
      3.times do |i|
        array_bins.append(4.times.map { |j| ROULETTE_TABLE[(4*i+j+1)] }.flatten)
      end
      array_bins
    end

    def number_column_bins
      array_bins = []
      3.times do |i|
        array_bins.append(12.times.map { |j| ROULETTE_TABLE[j+1][i] })
      end
      array_bins
    end

    def low_high_bins
      array_bins = []
      2.times do |i|
        array_bins.append(6.times.map { |j| ROULETTE_TABLE[(6*i+j+1)] }.flatten)
      end
      array_bins
    end

    def red_black_bins(color)
      COLOR_BINS.each_pair.map { |key, val| key if val == color }.compact
    end

    def odd_even_bins(opt)
      if opt == 'e'
        return COLOR_BINS.each_key.map { |key| key if key.to_i%2 == 0 && key.to_i != 0 }.compact
      end

      COLOR_BINS.each_key.map { |key| key if key.to_i%2 != 0 }.compact
    end

  private

    def valid_position?(row, col = 0)
      row.positive? && row < 13 && col >= 0 && col < 3
    end

    def get_row_col(bin)
      return (bin + 2)/3, (bin + 2)%3
    end

  end
end