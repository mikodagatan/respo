# frozen_string_literal: true

require 'forwardable'

module Respo
  class Response
    extend Forwardable
    include Helpers

    attr_reader :record

    def_delegators :serializer, :render

    class << self
      def call(record, **args)
        new(record, **args).call
      end
    end

    def initialize(record, **args)
      @record = record

      # NOTE: dynamically define instance variables
      args.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def serializer
      name = camelize(Respo.configuration.serializer.to_s)
      @serializer ||= Object.const_get("Respo::Serializers::#{name}")
    end
  end
end
