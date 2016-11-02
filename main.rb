require 'sinatra'
require 'pry'
require 'sinatra/reloader' # remove then deploying
require_relative 'db_config'
require_relative 'models/users'

get '/' do
  erb :index
end

# get "/user/new" do
#
#
# end
