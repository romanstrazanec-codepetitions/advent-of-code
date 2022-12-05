#!/usr/bin/ruby
# frozen_string_literal: true

def to_range(elf)
  from, to = elf.split('-')
  from..to
end

def to_pair(pair)
  pair.split(',').map { |elf| to_range elf }
end

def cover_case(existing_pair, new_pair)
  return :is_covered if existing_pair[0].cover?(new_pair[0]) && existing_pair[1].cover?(new_pair[1])
  return :covers if new_pair[0].cover?(existing_pair[0]) && new_pair[1].cover?(existing_pair[1])

  false
end

def check_pairs(pairs, new_pair)
  pairs.each_with_index do |existing_pair, idx|
    cc = cover_case(existing_pair, new_pair)

    case cc
    when :covers
      pairs[idx] = new_pair
      return 1
    when :is_covered
      return 1
    end
  end

  pairs << new_pair

  0
end

def solution_to_something_else(filename)
  pairs = []

  File.read(filename).split("\n").sum { |line| check_pairs(pairs, to_pair(line)) }
end

def solution(filename)
  File.read(filename).split("\n").sum do |line|
    elf1, elf2 = to_pair(line)
    elf1.cover?(elf2) || elf2.cover?(elf1) ? 1 : 0
  end
end

puts solution 'input.txt'
