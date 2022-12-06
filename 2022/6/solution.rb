#!/usr/bin/ruby
# frozen_string_literal: true

# require 'rspec/autorun'

def solution(data, offset)
  data
    .chomp
    .each_char
    .each_cons(offset)
    .find_index { |c| c.uniq.size == offset } + offset
end

# Part one
# p solution File.read(ARGV.first), 4

# Part two
# p solution File.read(ARGV.first), 14

# RSpec.describe 'Solution' do
#   describe 'part one' do
#     [
#       ['bvwbjplbgvbhsrlpgdmjqwftvncz', 5],
#       ['nppdvjthqldpwncqszvftbrmjlhg', 6],
#       ['nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg', 10],
#       ['zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw', 11],
#     ].each do |data, result|
#       it "finds #{result} for #{data}" do
#         expect(solution(data, 4)).to eq result
#       end
#     end
#   end
#
#   describe 'part two' do
#     [
#       ['mjqjpqmgbljsphdztnvjfqwrcgsmlb', 19],
#       ['bvwbjplbgvbhsrlpgdmjqwftvncz', 23],
#       ['nppdvjthqldpwncqszvftbrmjlhg', 23],
#       ['nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg', 29],
#       ['zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw', 26]
#     ].each do |data, result|
#       it "finds #{result} for #{data}" do
#         expect(solution(data, 14)).to eq result
#       end
#     end
#   end
# end

__END__
bvwbjplbgvbhsrlpgdmjqwftvncz
nppdvjthqldpwncqszvftbrmjlhg
nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg
zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw
