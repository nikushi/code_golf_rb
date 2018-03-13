require 'sinatra'

get '/' do
  vwcode = File.read('./router.rb')
  erb :index, locals: { vwcode: vwcode }
end
