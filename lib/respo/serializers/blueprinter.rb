# frozen_string_literal: true

module Respo
  module Serializers
    module Blueprinter
      def self.render(record, **args)
        serializer_constant(record).render(record, **args)
      end

      def self.serializer_constant(record)
        Object.const_get("#{model_name(record)}Blueprint")
      end

      def self.model_name(record)
        model_name = record.class.name
        if %w[
          Array
          ActiveRecord::Relation
        ].includes?(model_name)
          record[0].class.name
        else
          model_name
        end
      end
    end
  end
end
