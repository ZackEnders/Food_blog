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
		redirect '/'
	end	
end

post '/create_user' do

	@fname = params[:fname]
	@lname = params[:lname]
	@username= params[:username]
	@password = params[:password]

User.create(fname: @fname, lname: @lname, username: @username, password: @password)

if user = User.where(username: @username, password: @password).first
	session[:user_id] = user.id
	redirect "/user/#{user.id}/profile"
	else
		redirect '/'
	end	

end

get '/blogs' do
@blogs = Blog.all

erb :"/blogs/blogsfeed"
end


get '/user/:id/profile' do

@user = User.find(params[:id])
@person = User.find(session[:user_id])

erb :"/user/profile"
end


get '/blogs/view' do

@user = User.find(session[:user_id])
@blogs = Blog.where(user_id: @user.id)

erb :"blogs/viewblogs"
end

get '/blogs/edit' do


erb :"/blogs/editblog"
end

post '/update_blog' do

	@title = params[:title]
	@category = params[:category]
	@content = params[:content]

blog = Blog.find(session[:user_id])
blog.update(title: @title, category: @category, content: @content)	
redirect "/blogs/view"

end
post '/update_fname' do

@user = User.find(session[:user_id])
@user.update(fname: params[:fname], lname: @user.lname, username: @user.username, password: @user.password)

redirect "/user/#{@user.id}/profile"
end

post '/update_password' do 

@user = User.find(session[:user_id])
@user.update(fname: @user.fname, lname: @user.lname, username: @user.username, password: params[:password])
	redirect '/'
end

post '/delete_user' do 

@user = User.find(session[:user_id])
@user.destroy
	redirect '/login'
end

post '/create_blog_post' do 

@user = User.find(session[:user_id])

	@title = params[:title]
	@category = params[:category]
	@content = params[:content]


Blog.create(title: @title, category: @category, content: @content, user_id: @user.id)


redirect "/user/#{@user.id}/profile"

end







