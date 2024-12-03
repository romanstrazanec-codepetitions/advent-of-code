#!/usr/bin/ruby
# frozen_string_literal: true

data = if ARGV.empty?
         DATA.readlines
       else
         File.readlines(ARGV.first)
       end

puts 'Part 1'

def is_safe?(arr)
  diffs = arr.each_cons(2).map { _2 - _1 }
  diffs.all? { [1, 2, 3].include?(_1) } || diffs.all? { [-1, -2, -3].include?(_1) }
end

p data.sum {is_safe?(_1.split.map(&:to_i)) ? 1 : 0 }

puts 'Part 2'

def omit_elements(arr)
  arr.map.with_index { |_, index| arr[...index] + arr[index + 1..] }
end

p data.map { _1.split.map(&:to_i) }
      .sum { is_safe?(_1) || omit_elements(_1).any? { |damped_arr| is_safe? damped_arr } ? 1 : 0 }


__END__
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
