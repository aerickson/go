require "sequel"
require "yaml"

database_creds = YAML::load(File.read(File.join(File.dirname(__FILE__), 'config/database.yml')))
database = database_creds["go_db"]

namespace :db do
  namespace :migrate do

    Sequel.extension :migration
    DB = Sequel.connect(database)

    desc "Perform migration reset (full erase and migration up)"
    task :reset do
      Sequel::Migrator.run(DB, "migrations", :target => 0)
      Sequel::Migrator.run(DB, "migrations")
      puts "<= sq:migrate:reset executed"
    end

    desc "Perform migration up/down to VERSION"
    task :to do
      version = ENV['VERSION'].to_i
      raise "No VERSION was provided" if version.nil?
      Sequel::Migrator.run(DB, "migrations", :target => version)
      puts "<= sq:migrate:to version=[#{version}] executed"
    end

    desc "Perform migration up to latest migration available"
    task :up do
      Sequel::Migrator.run(DB, "migrations")
      puts "<= sq:migrate:up executed"
    end

    desc "Perform migration down (erase all data)"
    task :down do
      Sequel::Migrator.run(DB, "migrations", :target => 0)
      puts "<= sq:migrate:down executed"
    end
  end
  task :migrate => 'migrate:up'
end


