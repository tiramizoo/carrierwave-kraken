require "carrierwave/kraken/version"
require "carrierwave/kraken/carrierwave_extension"
require "kraken-io"

module CarrierWave
  module Kraken
    class OptimisationFailure < StandardError; end
    class << self
      def optimize(path, opts = {})
        krakening(path, opts)
      end

      private

      def krakening(path, opts)
        kraken = ::Kraken::API.new(
          api_key:    ENV["KRAKEN_API_KEY"],
          api_secret: ENV["KRAKEN_API_SECRET"]
        )
        data = kraken.upload(path, opts)

        if data.success
          File.open(path, "wb"){ |f| f.write open(data.kraked_url).read }
        else
          raise OptimisationFailure.new("Fail. Error message: #{data.message}")
        end
      end
    end
  end
end
