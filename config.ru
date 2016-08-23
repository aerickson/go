require 'sequel'
require 'yaml'

database_creds = YAML::load(File.read(File.join(File.dirname(__FILE__), 'config/database.yml')))
database = database_creds["go_db"]

Sequel.connect(database)

require './app'

run Sinatra::Application
