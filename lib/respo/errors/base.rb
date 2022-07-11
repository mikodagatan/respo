# frozen_string_literal: true

module Respo
  module Errors
    class Base < Response
      def call
        { json: { errors: @record.errors.full_messages }, status: status_code }
      end

      def status_code
        :unprocessable_entity
      end
    end
  end
end

require_relative 'show'
require_relative 'update'
require_relative 'destroy'
