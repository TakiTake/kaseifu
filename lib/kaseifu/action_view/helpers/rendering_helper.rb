module Kaseifu::ActionView::Helpers
  module RenderingHelper
    # Render partial if the given method is present as the receiver's method.
    #
    # For example, something like
    #   <% if @shop.page_design.shop_top_main_image.present? %>
    #     <%= render :shop_top_main_image, locals: { shop_top_main_image: @shop.page_design.shop_top_main_image } %>
    #   <% end %>
    # becomes
    #   <%= render_if_present :shop_top_main_image, in: @shop.page_design %>
    #
    # You can pass different path of partial
    #   <%= render_if_present :shop_top_main_image, in: @shop.page_design, partial: 'image' %>
    # same as
    #   <% if @shop.page_design.shop_top_main_image.present? %>
    #     <%= render :image, locals: { shop_top_main_image: @shop.page_design.shop_top_main_image } %>
    #   <% end %>
    #
    # You can use different name as a local variable name in the partial
    #   <%= render_if_present :shop_top_main_image, in: @shop.page_design, as: :shop_image %>
    # same as
    #   <% if @shop.page_design.shop_top_main_image.present? %>
    #     <%= render :shop_image, locals: { shop_image: @shop.page_design.shop_top_main_image } %>
    #   <% end %>
    #
    # You can pass more locals
    #   <%= render_if_present :shop_top_main_image, in: @shop.page_design, locals: { shop_name: @shop.name } %>
    # same as
    #   <% if @shop.page_design.shop_top_main_image.present? %>
    #     <%= render :shop_top_main_image, locals: { shop_top_main_image: @shop.page_design.shop_top_main_image, shop_name: @shop.name } %>
    #   <% end %>
    def render_if_present(method, in: nil, as: nil, **options)
      # "in" is special keyword so need to use local_variable_get to get value
      receiver = binding.local_variable_get(:in)

      fail ArgumentError, 'missing keyword: in' if receiver.nil?

      # If receiver doesn't respond to the given method, render nothing
      return '' unless receiver.respond_to?(method)

      key = (as || method).to_sym
      value = receiver.send(method)

      # If given method return blank, render nothing
      return '' if value.blank?

      # If partial file name is already exist use it else use key.
      options[:partial] ||= key.to_s

      options[:locals] ||= {}
      options[:locals].merge!(key => value)

      render options
    end
  end
end
