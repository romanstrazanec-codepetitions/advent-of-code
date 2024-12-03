#!/usr/bin/ruby
# frozen_string_literal: true

data = if ARGV.empty?
         DATA.read
       else
         File.read(ARGV.first)
       end

puts 'Part 1'
p data.scan(/mul\((\d{1,3}),(\d{1,3})\)/)
      .sum { _1.to_i * _2.to_i }

puts 'Part 2'
p data.gsub("\n", '')
      .gsub(/don't\(\).*?(do\(\)|$)/, '')
      .scan(/mul\((\d{1,3}),(\d{1,3})\)/)
      .sum { _1.to_i * _2.to_i }

__END__
xxmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))

