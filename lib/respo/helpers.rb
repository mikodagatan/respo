# frozen_string_literal: true

module Respo
  module Helpers
    def camelize(str)
      str.split('_').collect(&:capitalize).join
    end

    def model_name(record)
      record.class.name.split('::').last
    end

    def action_name(action_class)
      action_class.class.name.split('::').last.downcase.to_sym
    end

    # NOTE: only for successes and errors
    def self.singularize(str)
      {
        errors: 'error',
        successes: 'success'
      }[str.to_sym] || str
    end

    def self.pluralize(str)
      {
        error: 'errors',
        success: 'successes'
      }[str.to_sym] || str
    end
  end
end
