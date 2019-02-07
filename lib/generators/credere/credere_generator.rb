# lib/generators/credere/credere_generator.rb
require 'rails/generators'
require 'rails/generators/migration'
require_relative 'base_generator'

module Credere
  class CredereGenerator < BaseGenerator
    def create_migration_file
      migration_template 'migration.rb', 'db/migrate/create_credere_tables.rb'
    end
  end
end
