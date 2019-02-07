# lib/generators/credere/credere_generator.rb
require 'rails/generators'
require 'rails/generators/migration'
require_relative 'base_generator'

module Credere
  class UpgradeCredereGenerator < BaseGenerator
    def create_migration_file
      migration_template 'update_migration.rb', 'db/migrate/update_credere_tables.rb'
    end
  end
end
