require 'sinatra'
require 'sinatra/activerecord'


set database: 'sqlite3:main.sqlite'



require './models'



get '/'  do


erb :home
end

get '/login' do


erb :"/user/login"
end