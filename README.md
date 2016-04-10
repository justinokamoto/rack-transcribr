# Rack-Transcribr

I'm experimenting with creating Rack middleware gems. This lightweight gem servers as a replacement to Rack's CommonLogger statements. Improvements include colorized terminal output based on HTTP request method.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-transcribr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-transcribr

### For Rails

Install the gem and add this line in your application.rb
`config.middleware.use 'Rack::Transcribr'`

### For Rack

Install the gem and add these lines to your config.ru
`require 'rack/transcribr'
use Rack::Transcribr`

## Usage

Simply install in your rack app.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/justinokamoto/rack-transcribr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
