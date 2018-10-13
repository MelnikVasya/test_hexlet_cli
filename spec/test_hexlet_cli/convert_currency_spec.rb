require 'spec_helper'

class TestHttpClient
  attr_accessor :response_body

  def initialize(response_body)
    self.response_body = response_body
  end

  def get(*_args)
    response_body
  end
end

RSpec.describe TestHexletCli::Currency do
  it '#convert' do
    response = '{"date":"2018-10-12","rates":{"GBP":0.7572144462},"base":"USD"}'
    http_client = TestHttpClient.new(response)
    convertor = TestHexletCli::Currency.new(http_client)

    expect(convertor.convert(100, 'USD', 'GBP')).to eq(75.72)
  end
end
