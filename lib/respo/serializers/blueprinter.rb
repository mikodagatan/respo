# frozen_string_literal: true

module Respo
  module Serializers
    module Blueprinter
      def self.render(record, **args)
        serializer_constant(record).render(record, **args)
      end

      def self.serializer_constant(record)
        Object.const_get("#{model_name(record)}Blueprinter")
      end

      def self.model_name(record)
        record.class.name.split('::').last
      end
    end
  end
end
