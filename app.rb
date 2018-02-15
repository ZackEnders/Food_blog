require 'sinatra'
require 'sinatra/activerecord'



set :database, 'sqlite3:main.sqlite3'
set :sessions, true




require './models'



get '/'  do


erb :home
end

get '/login' do


erb :"/user/login"
end


post '/user_login' do

@username = params[:username]
@password = params[:password]

if
user = User.where(username: @username, password: @password).first
	session[:user_id] = user.id
	redirect "/user/#{user.id}/profile"
	else
		redirect '/login'
	end	
end

get '/blogs' do


erb :"/blogs/blogshome"
end


get '/user/:id/profile' do

@user = User.find(params[:id])


erb :"/user/profile"
end