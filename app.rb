require 'sinatra'
require 'sinatra/activerecord'


set :database, 'sqlite3:main.sqlite3'



require './models'



get '/'  do


erb :home
end

get '/login' do


erb :"/user/login"
end



get '/profile' do



erb :"/user/profile"
end