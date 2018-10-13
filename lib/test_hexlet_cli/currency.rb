require 'net/http'
require 'json'

module TestHexletCli
  class Currency
    EXCANGE_SERVICE_URL = 'https://api.exchangeratesapi.io/latest'

    attr_accessor :http_client

    def initialize(http_client = Net::HTTP)
      self.http_client = http_client
    end

    def convert(amount, from, to)
      uri = URI(EXCANGE_SERVICE_URL)
      uri.query = URI.encode_www_form(symbols: to, base: from)
      response_body = JSON.parse(http_client.get(uri))
      rate = response_body.dig('rates', to)

      (rate * amount).round(2)
    end
  end
end
