# frozen_string_literal: true

module Respo
  module Helpers
    def camelize(str)
      str.split('_').collect(&:capitalize).join
    end

    def self.model_name(record)
      record.class.name.split('::').last
    end
  end
end
