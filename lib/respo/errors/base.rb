# frozen_string_literal: true

module Respo
  module Errors
    class Base < Response
      include Helpers

      def call
        { json: { errors: @record.errors.full_messages }, status: status_code }
      end

      def status_code
        Respo::Constants::STATUSES.dig(action_name(self), :error).to_sym
      end
    end
  end
end

require_relative 'index'
require_relative 'show'
require_relative 'create'
require_relative 'update'
require_relative 'destroy'
