RSpec.describe Respo::Successes::Index do
  module Sample
    class Model
      attr_accessor :var1, :var2

      def initialize(var1, var2: nil)
        @var1 = var1
        @var2 = var2
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

  let(:record) { Sample::Model.new('Nice', var2: 'okay') }
  let(:record_array) { [Sample::Model.new('Nice', var2: 'okay')] }
  let(:expected_response) { { json: { record: record, view: :normal, root: nil }, status: :ok } }

  it 'uses the ModelBlueprint' do
    expect(Respo.index_success(record, view: :normal)).to eq(expected_response)
  end

  context 'when record is an array' do
    it 'uses the ModelBlueprint' do
      expect(Respo.index_success(record_array,
                                 view: :normal)[:json][:record][0].var1).to eq('Nice')
    end
  end
end
