require 'sinatra'
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

  strt = { x: 4, y: 0 };
  goal = { x: 5, y: 9 };
  ret = Router.route!(map, strt[:x], strt[:y], goal[:x], goal[:y])
  erb :index, locals: { retval: ret.flatten }
end
