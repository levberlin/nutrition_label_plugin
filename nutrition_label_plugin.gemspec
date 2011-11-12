$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nutrition_label_plugin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nutrition_label_plugin"
  s.version     = NutritionLabelPlugin::VERSION
  s.authors     = "Lev Berlin"
  s.email       = "lev.berlin@gmail.com"
  s.homepage    = "github.com/levberlin/nutrition_label_plugin"
  s.summary     = "Simple creation of basic nutrition fact label for Rails 3.1 apps"
  s.description = "Gem includes CSS and template for basic nutrition fact label, as well as a method that takes in a hash of optional macronutrients"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1"

  s.add_development_dependency "sqlite3"
end
