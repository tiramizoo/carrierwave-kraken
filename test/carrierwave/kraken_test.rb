require 'test_helper'

class TestUploader < CarrierWave::Uploader::Base
  include CarrierWave::Kraken::CarrierWaveExtension
  def current_path; File.expand_path('../../assets/test_image.jpg', __FILE__) end
end

class CarrierWave::KrakenTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CarrierWave::Kraken::VERSION
  end

  def test_delegate_to_kraken_with_current_path_to_the_file
    uploader = TestUploader.new
    CarrierWave::Kraken.expects(:optimize).with(uploader.current_path, {})
    uploader.optimize
  end

  def test_kraken_optimisation_with_synchronous_response
    ENV["KRAKEN_API_KEY"]    = "abcdefg"
    ENV["KRAKEN_API_SECRET"] = "abcdefg1234"
    VCR.use_cassette("successfuly_optimise_test_image_jpg", :match_requests_on => [:body]) do
      TestUploader.new.optimize
    end
  end

  def test_kraken_raises_exception_if_response_is_not_success
    failure_response = stub(success: false, message: "message details")
    ::Kraken::API.any_instance.expects(:upload).returns(failure_response)
    exception = assert_raises CarrierWave::Kraken::OptimisationFailure do
      TestUploader.new.optimize
    end
    exception.message.include?(failure_response.message)
  end
end
