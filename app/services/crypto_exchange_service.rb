require 'rest-client'
require 'json'
 
class CryptoExchangeService
  def initialize(source_currency, target_currency, amount)
    @source_currency = source_currency
    @target_currency = target_currency
    @amount = amount.to_f
  end
 
 
  def perform
    begin
      crypto_api_url = Rails.application.credentials[Rails.env.to_sym][:crypto_api_url]
      crypto_api_key = Rails.application.credentials[Rails.env.to_sym][:crypto_api_key]
      url = "#{crypto_api_url}fsym=#{@source_currency}&tsyms=#{@target_currency}&api_key=#{crypto_api_key}"
      res = RestClient.get url
      value = JSON.parse(res.body)
      value.values.first * @amount
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end