# Healthcheck

A simple gem to provide a healthcheck URL as Rack middleware; works with Rails OOTB.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'healthcheck'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install healthcheck

## Usage

### Rails

Adding the gem to a Gemfile of a Rails app will automatically add it as middleware before the logging middleware (so make sure you log something in your custom healthcheck.

Add a file `config/initializers/healthcheck.rb` and define your healthcheck:

```
Healthcheck.add do
  if ! is_everything_ok?
    Rails.logger.error "Healthcheck failed"
    false
  else
    true
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Alliants/healthcheck.
