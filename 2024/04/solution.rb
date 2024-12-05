#!/usr/bin/ruby
# frozen_string_literal: true

# require 'matrix'

data = if ARGV.empty?
         DATA.readlines.map(&:chomp)
       else
         File.readlines(ARGV.first).map(&:chomp)
       end

def iterate_diagonals(arr_2d)
  rows = arr_2d.size
  cols = arr_2d.first.size

  Enumerator.new do |y|
    (1 - rows...cols).each do |offset|
      main_diagonal = (0...rows).map do |i|
        j = i + offset
        arr_2d[i][j] if j >= 0 && j < cols
      end

      y << main_diagonal
    end

    (0...(rows + cols - 1)).each do |offset|
      anti_diagonal = (0...rows).map do |i|
        j = offset - i
        arr_2d[i][j] if j >= 0 && j < cols
      end

      y << anti_diagonal
    end
  end
end

puts 'Part 1'
columns = data.map { _1.split('') }.transpose.map(&:join)
diagonals = iterate_diagonals(data).map(&:compact).map(&:join)

p data.sum { _1.scan('XMAS').size } +
  data.sum { _1.scan('SAMX').size } +
  columns.sum { _1.scan('XMAS').size } +
  columns.sum { _1.scan('SAMX').size } +
  diagonals.sum { _1.scan('XMAS').size } +
  diagonals.sum { _1.scan('SAMX').size }

puts 'Part 2'
res = (data.size - 2).times.sum do |i|
  (data[i].split('').size - 2).times.sum do |j|
    data[i + 1][j + 1] == 'A' && (
      (data[i][j] == 'M' && data[i + 2][j + 2] == 'S') ||
      (data[i][j] == 'S' && data[i + 2][j + 2] == 'M')
    ) && (
      (data[i][j + 2] == 'M' && data[i + 2][j] == 'S') ||
      (data[i][j + 2] == 'S' && data[i + 2][j] == 'M')
    ) ? 1 : 0
  end
end

p res

__END__
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
