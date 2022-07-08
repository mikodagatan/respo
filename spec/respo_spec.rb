# frozen_string_literal: true

class Record
  def name
    'Label'
  end
end

RSpec.describe Respo do
  let(:record) { Record.new }

  it 'has a version number' do
    expect(Respo::VERSION).not_to be nil
  end

  it 'works' do
    # expect(Respo.status('index', 'error')).to eq(1)
    # expect(Respo.respond_to?(:status)).to eq(1)
    # expect(Respo.new).to eq('world')
    expect(described_class.not_found(record)).to eq('WORLD')
  end
end
