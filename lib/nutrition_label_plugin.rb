require 'nutrition_label_plugin/railtie' if defined?(Rails)
require 'nutrition_label_plugin/engine' if ::Rails.version >= "3.1"
