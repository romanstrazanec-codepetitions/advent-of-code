#!/usr/bin/ruby
# frozen_string_literal: true

def check_rucksack(str)
  half_index = str.size / 2
  first_half = str[0...half_index]

  (half_index...str.size).each do |i|
    return get_priority(str[i]) if first_half.include?(str[i])
  end
end

# @param [Array<String>] r1
# @param [Array<String>] r2
# @param [Array<String>] r3
def check_rucksacks(r1, r2, r3)
  r1.each_char do |i|
    r2.each_char do |j|
      r3.each_char do |k|
        return get_priority(i) if i == j && j == k
      end
    end
  end
end

def get_priority(char)
  (char.ord - 96) % 58
end

def solution1(filename)
  File.read(filename).split("\n").sum { |rucksack| check_rucksack rucksack }
end

def solution2(filename)
  File.read(filename).split("\n").each_slice(3).sum { |elf_group| check_rucksacks *elf_group }
end

puts solution1 'input.txt'
puts solution2 'input.txt'
