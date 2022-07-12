# frozen_string_literal: true

# TODO
RSpec.describe Respo::Successes::Destroy do
  include Sample
  let(:record) { Sample::Model.new('Nice', var2: 'okay', name: 'AwesomeName') }
  let(:expected_response) { { json: { record: record, view: :normal, root: nil }, status: :ok } }

  it 'uses the ModelBlueprint' do
    expect(Respo.destroy_success(record, view: :normal, label: 'Cars')[:json]).to eq('Deleted AwesomeName Cars')
  end
end
