require 'icons/view_helpers'

module Icons
  class Railtie < Rails::Railtie
    initializer "icons.view_helpers" do
      ActiveSupport.on_load(:action_view) { include Icons::ViewHelpers }
    end
  end
end