# frozen_string_literal: true

RSpec.describe Respo::Errors::Create do
  include Sample
  let(:record) { Sample::Model.new('Nice', var2: 'okay') }
  let(:expected_response) { { json: { record: record, view: :normal, root: nil }, status: :ok } }

  it 'uses the ModelBlueprint' do
    expect(Respo.create_error(record, view: :normal)).to eq(expected_response)
  end
end
