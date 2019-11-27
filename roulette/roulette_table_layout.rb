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

  private

    def valid_position?(row, col)
      row.positive? && row < 13 && col >= 0 && col < 3
    end

    def get_row_col(bin)
      return (bin + 2)/3, (bin + 2)%3
    end

  end
end