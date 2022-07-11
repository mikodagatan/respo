# frozen_string_literal: true

module Respo
  module Successes
    class Destroy < Respo::Successes::Base
      def data
        "Deleted #{record_name} #{record}"
      end

      def record_name
        record.name || record.title || record.label
      end
    end
  end
end
