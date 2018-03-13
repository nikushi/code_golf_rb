# frozen_string_literal: true

require_relative 'router'
require 'pp'

map = [
	[5,5,4,2,1,1,1,2,2,3],
	[5,4,3,2,1,1,2,2,3,4],
	[5,4,2,1,1,2,2,4,5,5],
	[4,4,2,1,2,2,3,3,4,5],
	[4,3,1,1,4,3,3,3,4,5],
	[3,1,1,5,4,3,2,3,4,5],
	[2,1,3,4,3,3,2,2,3,4],
	[1,1,3,4,3,2,1,1,2,3],
	[2,1,1,3,4,2,2,3,4,4],
	[3,2,1,1,3,3,3,3,4,5],
]

ans = [
	[4, 0],
	[4, 1],
	[4, 2],
	[3, 2],
	[3, 3],
	[3, 4],
	[2, 4],
	[2, 5],
	[1, 5],
	[1, 6],
	[1, 7],
	[1, 8],
	[2, 8],
	[2, 9],
	[3, 9],
	[4, 9],
	[5, 9],
]

strt = { x: 4, y: 0 };
goal = { x: 5, y: 9 };

ret = Router.route!(map, strt[:x], strt[:y], goal[:x], goal[:y])

puts 'マップ'
pp map
puts '答え'
pp ans
puts '計算結果'
pp ret
if ans == ret
  puts 'correct!'
else
  puts 'incorrect!'
end
