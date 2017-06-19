# Carrierwave::Kraken

Gem enables kraken image optimisation for carrierwave

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'carrierwave-kraken'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carrierwave-kraken

## Usage

Include extension to uploader class
```ruby
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::Kraken::CarrierWaveExtension
```

Call `process :optimize` in uploader. I.e:

```ruby
  version :thumbnail do
    process optimize: [{lossy: true}]
  end
```

Don't forget to specify ENV['KRAKEN_API_KEY'] and ENV['KRAKEN_API_SECRET'] variables

## Known issues

- `Broken pipe` exception when calling kraken.upload - It's probably, because of ssl connection getting closed while uploading too large file (>16M).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tiramizoo/carrierwave-kraken.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

