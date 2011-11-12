require 'nutrition_label_plugin/view_helpers'
module NutritionLabelPlugin 
  class Railtie < Rails::Railtie
    initializer "nutrition_label_plugin.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end

