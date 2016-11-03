require 'sinatra'
require 'pry'
require 'sinatra/reloader' # remove when deploying
require_relative 'db_config'
require_relative 'models/users'
require_relative 'models/trips'

binding.pry

