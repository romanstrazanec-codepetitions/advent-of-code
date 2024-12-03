#!/usr/bin/ruby
# frozen_string_literal: true

# A, X = Rock = 1
# B, Y = Paper = 2
# C, Z = Scissors = 3
# Win = 6
# Draw = 3
# Defeat = 0
# Final score is sum of the result and chosen shape.
def get_result1(round)
  # chosen shape + round result
  return 1 + 3 if round == 'A X' # rock - rock
  return 2 + 6 if round == 'A Y' # rock - paper
  return 3 + 0 if round == 'A Z' # rock - scissors
  return 1 + 0 if round == 'B X' # paper - rock
  return 2 + 3 if round == 'B Y' # paper - paper
  return 3 + 6 if round == 'B Z' # paper - scissors
  return 1 + 6 if round == 'C X' # scissors - rock
  return 2 + 0 if round == 'C Y' # scissors - paper
  return 3 + 3 if round == 'C Z' # scissors - scissors
  0
end

# A = Rock
# B = Paper
# C = Scissors
# X = Lose
# Y = Draw
# Z = Win
# Win = 6
# Draw = 3
# Defeat = 0
# Final score is sum of the result and chosen shape.
def get_result2(round)
  # chosen shape + round result
  return 3 + 0 if round == 'A X' # rock - lose = scissors
  return 1 + 3 if round == 'A Y' # rock - draw = rock
  return 2 + 6 if round == 'A Z' # rock - win = paper
  return 1 + 0 if round == 'B X' # paper - lose = rock
  return 2 + 3 if round == 'B Y' # paper - draw = paper
  return 3 + 6 if round == 'B Z' # paper - win = scissors
  return 2 + 0 if round == 'C X' # scissors - lose = paper
  return 3 + 3 if round == 'C Y' # scissors - draw = scissors
  return 1 + 6 if round == 'C Z' # scissors - win = rock
  0
end

def solution(filename)
  File.read(filename).split("\n").map { |round| yield round }.sum
end

puts solution('input.txt') { |round| get_result1 round } # part 1
puts solution('input.txt') { |round| get_result2 round } # part 2
