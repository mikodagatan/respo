# frozen_string_literal: true

module Respo
  module Errors
    class Show < Respo::Errors::Base
      def status_code
        :not_found
      end
    end
  end
end
