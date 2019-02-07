# lib/generators/credere/credere_generator.rb
require 'rails/generators'
require 'rails/generators/migration'
require_relative 'base_generator'

module Credere
  class TenancyGenerator < BaseGenerator
    def create_migration_file
      migration_template 'tenant_migration.rb', 'db/migrate/tenant_credere_tables.rb'
    end
  end
end
