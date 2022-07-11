# frozen_string_literal: true



module Respo
  module Success
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
        :ok
      end

      def action_name
        this.class.name.split('::').last
      end
    end
  end
end

require_relative 'index'
require_relative 'show'
require_relative 'update'
require_relative 'destroy'
