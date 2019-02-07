# Credere
require "rails"

module Credere
  class Engine < Rails::Engine
    isolate_namespace Credere
  end


  # ------------------------------ tenancy ------------------------------
  # configuration to enable or disable tenancy
  mattr_accessor :enable_tenancy
  enable_tenancy = false

  mattr_accessor :tenant_class
  tenant_class = nil


  # provide hook to configure attributes
  def self.config
    yield(self)
  end
end
