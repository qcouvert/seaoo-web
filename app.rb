require 'sinatra'

get '/' do
    "Hello World!"
end

get '/favicon.ico' do
  nil
end
