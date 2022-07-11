# frozen_string_literal: true

module Respo
  module Successes
    class Base < Response
      def initialize(record, view: nil, root: nil)
        super(record, view: view, root: root)
      end

      def call
        { json: data, status: status_code }
      end

      private

      def data
        serializer.render(record, view: @view, root: @root)
      end

      def status_code
        Respo::Constants::STATUSES.dig(action_name(self), :success).to_sym
      end
    end
  end
end

require_relative 'index'
require_relative 'show'
require_relative 'update'
require_relative 'destroy'
