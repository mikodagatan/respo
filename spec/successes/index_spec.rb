# frozen_string_literal: true

# TODO
RSpec.describe Respo::Successes::Index do
  include Sample
  let(:record) { Sample::Model.new('Nice', var2: 'okay') }
  let(:record_array) { [record] }
  let(:expected_response) { { json: { record: record, view: :normal, root: nil }, status: :ok } }

  it 'uses the ModelBlueprint' do
    expect(Respo.index_success(record, view: :normal)).to eq(expected_response)
  end

  context 'when record is an array' do
    it 'uses the ModelBlueprint' do
      expect(Respo.show_success(record_array,
                                view: :normal)[:json][:record][0].var1).to eq('Nice')
    end
  end
end
