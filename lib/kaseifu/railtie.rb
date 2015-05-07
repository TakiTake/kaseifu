require 'rails/railtie'

module Kaseifu
  class Railtie < ::Rails::Railtie
    initializer 'kaseifu.include_helpers' do
      ActiveSupport.on_load :action_view do
        include Kaseifu::ActionView::Helpers
      end
    end
  end
end
