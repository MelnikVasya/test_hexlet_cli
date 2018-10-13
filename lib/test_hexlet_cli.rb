require 'test_hexlet_cli/version'
require 'test_hexlet_cli/currency'

module TestHexletCli
  def self.convert(amount, from_currency, to_currency)
    convertor = TestHexletCli::Currency.new
    convertor.convert(amount, from_currency, to_currency)
  end
end
