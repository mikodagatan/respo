# frozen_string_literal: true

RSpec.describe Respo::Helpers do
  include Respo::Helpers

  let(:str) { 'String::Sample.sample_method' }

  it 'can camelize' do
    expect(camelize(str)).to eq('String::sample.sampleMethod')
  end

  it 'can show the action name' do
    expect(action_name(Respo::Successes::Update.new(Object.new))).to eq(:update)
  end

  it 'can singularize on error and success ' do
    expect(described_class.singularize('errors')).to eq('error')
    expect(described_class.singularize('successes')).to eq('success')
  end

  it 'can pluralize on error and success' do
    expect(described_class.pluralize('error')).to eq('errors')
    expect(described_class.pluralize('success')).to eq('successes')
  end
end
