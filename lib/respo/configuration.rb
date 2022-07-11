# frozen_string_literal: true

module Respo
  class Configuration
    attr_accessor :serializer

    def initialize
      @serializer = :blueprinter
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration if block_given?
  end
end
