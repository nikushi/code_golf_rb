require 'sinatra'
require "sinatra/reloader" if development?
require 'json'
require 'pp'
require_relative 'router'

get '/' do
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

  answers = JSON.parse(File.read('answers.json'))
  start_x = (0..9).to_a.sample # おみくじ
  start_y = (0..9).to_a.sample # おみくじ
  ans = answers["#{start_x}_#{start_y}"]
  strt = { x: start_x, y: start_y };
  goal = { x: 5, y: 9 };

  puts '#### debug ###'
  puts "スタート: #{strt}"
  puts "ゴール  : #{strt}"
  puts "マップ"
  pp map

  ret = Router.route!(map, strt[:x], strt[:y], goal[:x], goal[:y])
  wc = File.read('router.rb').length

  puts "算出経路"
  p ret
  erb :index, locals: { retval: ret.flatten, wc: wc, ans: ans}
end
