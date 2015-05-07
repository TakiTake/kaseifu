module Kaseifu
  module ActionView
    module Helpers
      extend ActiveSupport::Autoload

      autoload :RenderingHelper

      include RenderingHelper
    end
  end
end
