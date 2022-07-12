# frozen_string_literal: true

module Sample
  class Model
    attr_accessor :var1, :var2, :name

    def initialize(var1, var2: nil, name: nil)
      @var1 = var1
      @var2 = var2
      @name = name
    end
  end

  class ModelBlueprint
    attr_accessor :record, :view, :root

    def initialize(record, view: nil, root: nil)
      @record = record
      @view = view
      @root = root
    end

    class << self
      def render(record, **args)
        new(record, **args).render
      end
    end

    def render
      { record: record, view: view, root: root }
    end
  end
end
