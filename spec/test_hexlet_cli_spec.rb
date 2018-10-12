require 'spec_helper'

RSpec.describe TestHexletCli do
  it 'has a version number' do
    expect(TestHexletCli::VERSION).not_to be nil
  end

  it '.run' do
    expect(TestHexletCli::Base.new.run).to eq('work')
  end
end
