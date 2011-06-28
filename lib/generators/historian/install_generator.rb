require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record/migration'

module Historian
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    extend ActiveRecord::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)

    desc 'Generates a migration to add the historian_records table.'
    def create_migration_file
      migration_template 'create_historian_categories.rb', 'db/migrate/create_historian_categories.rb'
      migration_template 'create_historian_records.rb', 'db/migrate/create_historian_records.rb'
      migration_template 'create_historian_metrics.rb', 'db/migrate/create_historian_metrics.rb'
    end
    
    desc 'Copy assets to public directory'
    def copy_assets
      template 'historian.css', 'public/stylesheets/historian.css'
    end
  end
end