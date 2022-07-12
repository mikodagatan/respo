# frozen_string_literal: true

module Respo
  module Successes
    class Index < Respo::Successes::Base
      def initialize(record, view: nil, root: nil)
        super(record, view: view, root: root)
      end
    end
  end
end
