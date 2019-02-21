# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "credere/version"
require "date"

Gem::Specification.new do |s|
  s.name = %q{credere}
  s.version = Credere::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eric Roberts"]
  s.date = Date.today
  s.description = %q{The Credere plugin provides a complete double entry accounting system for use in any Ruby on Rails application. The plugin follows general Double Entry Bookkeeping practices. All calculations are done using BigDecimal in order to prevent floating point rounding errors. The plugin requires a decimal type on your database as well. It is strongly based off of the Plutus gem.}
  s.email = %q{ericroberts@legalshieldcorp.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.markdown"
  ]
  s.add_dependency("rails", "> 4.0")
  s.add_dependency("kaminari", "~> 1.0")
  s.add_development_dependency("yard")
  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.markdown"]
  s.homepage = %q{http://github.com/legalshield/credere}
  s.license = 'MIT'
  s.require_paths = ["lib"]
  s.required_rubygems_version = ">= 1.3.6"
  s.summary = %q{A Plugin providing a Double Entry Accounting Engine for Rails}
  s.test_files = Dir["{spec}/**/*"]

  if s.respond_to? :specification_version then
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.0.0') then
    else
    end
  else
  end
end

