# frozen_string_literal: true

module Respo
  module Successes
    class Destroy < Respo::Successes::Base
      def data
        "Deleted #{record_name} #{label || clean_label}"
      end
    end
  end
end
