# frozen_string_literal: true

RSpec.describe Respo::Constants do
  it 'will have the common statuses' do
    expect(Respo::Constants::STATUSES.dig(:create, :error)).to eq(:unprocessable_entity)
  end
end
