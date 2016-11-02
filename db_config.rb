require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'trippals'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)
