#!/usr/bin/ruby
# frozen_string_literal: true

data = if ARGV.empty?
         DATA.readlines
       else
         File.readlines(ARGV.first)
       end

stacks = []
parsing_stacks = true

data.each do |line|
  stack_idx = 0

  if line.start_with?(' 1') || line.empty?
    parsing_stacks = false
    next
  end

  if parsing_stacks
    line.each_char.each_slice(4) do |chars|
      chars = chars.join.strip

      stacks[stack_idx] ||= []
      stacks[stack_idx] << chars[1] unless chars.empty?

      stack_idx += 1
    end
  else
    if /move (\d+) from (\d+) to (\d+)/.match(line)
      # Part One
      # stacks[$3.to_i - 1].unshift(*stacks[$2.to_i - 1].shift($1.to_i).reverse)

      # Part Two
      stacks[$3.to_i - 1].unshift(*stacks[$2.to_i - 1].shift($1.to_i))
    end
  end
end

p stacks.map(&:first).join

__END__
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2