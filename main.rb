require 'sinatra'
require 'slim'
require 'pry'
require 'sqlite3'
require 'sinatra/reloader'
require 'json'

require_relative 'database/database_setup'
require_relative 'models/slide'

require_relative 'controllers/main_controller'

binding.pry
