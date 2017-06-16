$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'carrierwave/kraken'

require 'minitest/autorun'
require 'minitest/unit'
require 'mocha/mini_test'
require 'vcr'

require 'uri'
require 'carrierwave'

VCR.configure do |config|
  config.cassette_library_dir = "test/fixtures/vcr_cassettes"
  config.hook_into :webmock
end