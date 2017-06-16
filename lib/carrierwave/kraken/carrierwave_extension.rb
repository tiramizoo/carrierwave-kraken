module CarrierWave
  module Kraken
    module CarrierWaveExtension
      def optimize(opts = {})
        CarrierWave::Kraken.optimize(current_path, opts)
      end
    end
  end
end