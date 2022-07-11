# frozen_string_literal: true

require_relative 'respo/base'

module Respo
  include Helpers

  def self.method_missing(method, *args)
    action, status = method.to_s.split('_')

    return 'No Method' unless %w[success error].include?(status)

    klass_name = "Respo::#{Helpers.pluralize(status).capitalize}::#{action.capitalize}"
    klass = Object.const_get(klass_name)
    klass.call(args)
  end
end
