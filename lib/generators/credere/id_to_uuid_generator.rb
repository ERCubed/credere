# lib/generators/credere/credere_generator.rb
require 'rails/generators'
require 'rails/generators/migration'
require_relative 'base_generator'

module Credere
  class IdToUuidGenerator < BaseGenerator
    def create_migration_file
      migration_template 'id_to_uuid_migration.rb', 'db/migrate/id_to_uuid_credere_tables.rb'
    end
  end
end
