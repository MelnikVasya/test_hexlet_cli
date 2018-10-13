require 'spec_helper'

RSpec.describe TestHexletCli::Currency do
  describe '#convert' do
    it 'success response' do
      http_client = double('http_client')

      allow(http_client).to receive(:get) do
        '{"date":"2018-10-12","rates":{"GBP":0.7572144462},"base":"USD"}'
      end

      convertor = TestHexletCli::Currency.new(http_client)

      expect(convertor.convert(100, 'USD', 'GBP')).to eq(75.72)
    end

    it 'error response' do
      http_client = double('http_client')

      allow(http_client).to receive(:get) do
        '{"error":"Base \'US\' is not supported."}'
      end

      convertor = TestHexletCli::Currency.new(http_client)

      expect(convertor.convert(100, 'US', 'GB')).to eq(75.72)
    end
  end
end
