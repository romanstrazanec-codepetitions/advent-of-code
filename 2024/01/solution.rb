#!/usr/bin/ruby
# frozen_string_literal: true

data = if ARGV.empty?
         DATA.readlines
       else
         File.readlines(ARGV.first)
       end

puts 'Part 1'
p data.map { _1.split(/\s+/).map(&:to_i) }
      .transpose
      .map(&:sort)
      .transpose
      .map { (_1 - _2).abs }
      .sum

puts 'Part 2'
p data.map { _1.split(/\s+/).map(&:to_i) }
      .transpose
      .reduce { [_1, _2.tally] }
      .reduce { |left, right_counts| left.reduce(0) { |s, n| s + n * right_counts[n].to_i } }

__END__
3   4
4   3
2   5
1   3
3   9
3   3
