require 'rubygems'
require 'sinatra'

get '/**' do
  puts request.inspect
  puts "**#{request.body.read}**"
  sleep 1
  "hello world"
end

put '/**' do
  puts request.inspect
  puts "**#{request.body.read}**"
end

post '/**' do
  puts request.inspect
  puts "**#{request.body.read}**"
end

delete '/**' do
  puts request.inspect
  puts "**#{request.body.read}**"
end