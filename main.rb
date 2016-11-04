require 'sinatra'
require 'pry'
require 'sinatra/reloader' # remove when deploying
require_relative 'db_config'
require_relative 'models/users'
require_relative 'models/trips'

enable :sessions # creates session as a global object - basicaly a hash

helpers do

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end

  # show all trips
get '/' do
  @trips = Trip.all
  erb :index
end

get '/trip/all' do
  @trips = Trip.all
  erb :trip_all
end

get '/user/new' do

  erb :user_new
end

get '/user/:id' do
  # @user = session[:user_id].id

  erb :user_show
end


post '/user' do
  user = User.new
  user.email = params[:email]
  user.password = params[:password]
  user.username = params[:username]
  user.gender = params[:gender]
  user.age_group = params[:age_group]
  user.home_country = params[:home_country]
  user.prof_pic_url = params[:prof_pic_url]

  if user.save
    redirect to '/'
  else
    erb :user_new
  end
end

#   # update and edit users/profile
get '/user/:id/edit' do
  @user = User.find(params[:id])

  if session[:user_id] != nil

    erb :user_edit
  else
    redirect to '/'
  end
end

post '/user/:id' do
  @user = User.find(params[:id])
  @user.update(username: params[:username])
  @user.update(email: params[:email])
  @user.update(password: params[:password])
  @user.update(gender: params[:gender])
  @user.update(age_group: params[:age_group])
  @user.update(home_country: params[:home_country])
  @user.update(prof_pic_url: params[:prof_pic_url])

  redirect to '/'
end


get '/trip/new' do
  # redirect to '/session'
  @trip = Trip.all
  erb :trip_new
end

get '/trip/:id' do
  @trip = Trip.find(params[:id])

  erb :trip_show
end

post '/trip' do
  trip = Trip.new
  trip.trip_name = params[:trip_name]
  trip.dest_country = params[:dest_country]
  trip.month = params[:month]
  trip.gender = params[:gender]
  trip.age_group = params[:age_group]
  trip.body = params[:body]
  trip.user_id = params[:user_id] # do I get this from the session?

  if trip.save
    redirect to '/'
  else
    erb :trip_new
  end
end

#   # update and edit trips
get '/trip/:id/edit' do
  @trip = Trip.find(params[:id])

  erb :trip_edit
end

post '/trip/:id' do
  @trip = Trip.find(params[:id])
  @trip.update(trip_name: params[:trip_name])
  @trip.update(dest_country: params[:dest_country])
  @trip.update(month: params[:month])
  @trip.update(gender: params[:gender])
  @trip.update(age_group: params[:age_group])
  @trip.update(body: params[:body])

  redirect to '/'
end

get '/trip/:id/delete' do
  @trip = Trip.find(params[:id])

  erb :trip_delete
end

delete '/trip/:id' do
  @trip = Trip.find(params[:id])
  @trip.delete
  redirect to '/'
end

get '/session/new' do
  erb :session_new
end

post '/session' do
  user = User.find_by(email: params[:email])

  if user && user.authenticate(params[:password])
    # you are fine - found email in Db
    session[:user_id] = user.id
    redirect to '/'
  else
    #who are you?
    erb :session_new
  end
end

delete '/session' do
  # remove the session
  session[:user_id] = nil
  redirect to '/session/new'
end
