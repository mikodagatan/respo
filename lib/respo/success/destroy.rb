# frozen_string_literal: true

module Respo
  module Success
    class Destroy < Respo::Success::Base
      def data
        "Deleted #{record_name} #{record}"
      end

      def record_name
        record.name || record.title || record.label
      end
    end
  end
end
