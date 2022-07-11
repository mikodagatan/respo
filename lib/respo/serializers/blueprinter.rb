# frozen_string_literal: true

module Respo
  module Serializers
    module Blueprinter
      include Helpers

      def self.render(record, **args)
        serializer_constant(record).render(record, **args)
      end

      def serializer_constant(record)
        Object.const_get("#{model_name(record)}Blueprinter")
      end
    end
  end
end
