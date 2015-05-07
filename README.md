# Kaseifu [<img src="https://travis-ci.org/TakiTake/kaseifu.svg"/>](http://travis-ci.org/TakiTake/kaseifu) [<img src="https://img.shields.io/codeclimate/github/TakiTake/kaseifu.svg" />](https://codeclimate.com/github/TakiTake/kaseifu)

Add useful helper methods to your Rails APP.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kaseifu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kaseifu

## Usage

### render\_if\_present

Render partial if the given method is present as the receiver's method.

For example, something like

```erb
<%= render_if_present :shop_image_path, in: @shop %>
```

same as

```erb
<% if @shop.shop_image_path.present? %>
  <%= render 'shop_image_path', locals: { shop_image_path: @shop.shop_image_path } %>
<% end %>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/kaseifu/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
