module Respo
  class Configuration
    attr_accessor :serializer

    def initialize
      @serializer = :blueprinter
    end

    class << self
      def configuration
        @configuration ||= new
      end

      def configure
        yield configuration if block_given?
      end
    end
  end
end
