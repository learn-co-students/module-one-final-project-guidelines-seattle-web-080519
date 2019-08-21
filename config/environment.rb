require 'bundler'
Bundler.require
require_relative "../app/models/brewery.rb"
require_relative "../app/models/user.rb"
require_relative "../app/models/review.rb"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
