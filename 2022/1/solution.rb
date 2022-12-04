#!/usr/bin/ruby
# frozen_string_literal: true

def solution(filename, max=1)
  split_by_blank_lines = File.read(filename).split("\n\n")
  split_by_blank_lines.map { |group| group.split.map(&:to_i).sum }.max(max).sum
end

puts solution 'input.txt' # part 1
puts solution 'input.txt', 3 # part 2
