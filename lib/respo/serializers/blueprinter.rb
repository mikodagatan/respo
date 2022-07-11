# frozen_string_literal: true

module Respo
  module Serializers
    module Blueprinter
      include Respo::Helpers

      def self.render(record, **args)
        serializer_constant(record).render(record, **args)
      end

      def self.serializer_constant(record)
        Object.const_get("#{Respo::Helpers.model_name(record)}Blueprinter")
      end
    end
  end
end
