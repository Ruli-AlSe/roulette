# frozen_string_literal: true

require 'colorize'

module Roulette
  # RouletteTableLayout contains the layouts for the game table
  module RouletteTableLayout
    COLOR_BINS = { '0' => 'g', '00' => 'g', '1' => 'r', '2' => 'b', '3' => 'r',
                   '4' => 'b', '5' => 'r', '6' => 'b', '7' => 'r', '8' => 'b',
                   '9' => 'r', '10' => 'b', '11' => 'b', '12' => 'r',
                   '13' => 'b', '14' => 'r', '15' => 'b', '16' => 'r',
                   '17' => 'b', '18' => 'r', '19' => 'r', '20' => 'b',
                   '21' => 'r', '22' => 'b', '23' => 'r', '24' => 'b',
                   '25' => 'r', '26' => 'b', '27' => 'r', '28' => 'b',
                   '29' => 'b', '30' => 'r', '31' => 'b', '32' => 'r',
                   '33' => 'b', '34' => 'r', '35' => 'b', '36' => 'r' }.freeze

    ROULETTE_TABLE = [%w[0 00],
                      %w[1 2 3],
                      %w[4 5 6],
                      %w[7 8 9],
                      %w[10 11 12],
                      %w[13 14 15],
                      %w[16 17 18],
                      %w[19 20 21],
                      %w[22 23 24],
                      %w[25 26 27],
                      %w[28 29 30],
                      %w[31 32 33],
                      %w[34 35 36]].freeze

    def split_bet_bins(bin)
      row, col = get_row_col(bin)
      array_bins = [ROULETTE_TABLE[row][col]]
      array_bins.append(ROULETTE_TABLE[row - 1][col]) if valid_position?(row - 1, col)
      array_bins.append(ROULETTE_TABLE[row + 1][col]) if valid_position?(row + 1, col)
      array_bins.append(ROULETTE_TABLE[row][col - 1]) if valid_position?(row, col - 1)
      array_bins.append(ROULETTE_TABLE[row][col + 1]) if valid_position?(row, col + 1)
      array_bins
    end

    def street_bet_bins(bin)
      row = get_row_col(bin)
      ROULETTE_TABLE[row.first]
    end

    def line_bet_bins(bin)
      row = get_row_col(bin)
      array_bins = [ROULETTE_TABLE[row.first]]
      array_bins.append(ROULETTE_TABLE[row.first - 1]) if valid_position?(row.first - 1)
      array_bins.append(ROULETTE_TABLE[row.first + 1]) if valid_position?(row.first + 1)
      array_bins
    end

    def number_ranges_bins
      array_bins = []
      3.times do |i|
        array_bins.append(4.times.map { |j| ROULETTE_TABLE[(4 * i + j + 1)] }.flatten)
      end
      array_bins
    end

    def number_column_bins
      array_bins = []
      3.times do |i|
        array_bins.append(12.times.map { |j| ROULETTE_TABLE[j + 1][i] })
      end
      array_bins
    end

    def low_high_bins
      array_bins = []
      2.times do |i|
        array_bins.append(6.times.map { |j| ROULETTE_TABLE[(6 * i + j + 1)] }.flatten)
      end
      array_bins
    end

    def red_black_bins(opt)
      color = opt == 1 ? 'r' : 'b'
      COLOR_BINS.each_pair.map { |key, val| key if val == color }.compact
    end

    def odd_even_bins(opt)
      if opt == 1
        return COLOR_BINS.each_key.map { |key| key if key.to_i.even? && key.to_i != 0 }.compact
      end

      COLOR_BINS.each_key.map { |key| key unless key.to_i.even? }.compact
    end

    def print_table(bin)
      ROULETTE_TABLE.each do |row|
        print "\n\t\t\t|".bold.yellow
        row.each do |elem|
          if elem == bin
            print " #{elem} |".blink.white.colorize(background: :cyan)
          else
            print " #{elem} |".bold.colorize(background: background(elem))
          end
        end
      end
    end

    private

    def background(bin)
      return :red if COLOR_BINS[bin] == 'r'
      return :black if COLOR_BINS[bin] == 'b'

      :green
    end

    def valid_position?(row, col = 0)
      row.positive? && row < 13 && col >= 0 && col < 3
    end

    def get_row_col(bin)
      [(bin + 2) / 3, (bin + 2) % 3]
    end
  end
end
