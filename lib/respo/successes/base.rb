# frozen_string_literal: true

module Respo
  module Successes
    class Base < Response
      attr_reader :label

      def initialize(record, view: nil, root: nil, label: nil)
        super(record, view: view, root: root, label: label)
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

      def record_name
        %w[name label title].each do |attr|
          return record.send(attr) if record.respond_to?(attr)
        end
        'No Record Name'
      end

      def clean_label
        record.class.name.split('::')
      end
    end
  end
end

require_relative 'index'
require_relative 'show'
require_relative 'create'
require_relative 'update'
require_relative 'destroy'
