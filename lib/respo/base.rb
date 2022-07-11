# frozen_string_literal: true

require_relative 'version'
require_relative 'constants'
require_relative 'helpers'
require_relative 'configuration'
require_relative 'respo_error'
require_relative 'serializers/blueprinter'
require_relative 'response'
require_relative 'successes/base'
require_relative 'errors/base'

module Respo
  class Base
    attr_reader :record
  end
end
