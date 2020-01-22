module Ecocash
  class Configuration
    attr_accessor :username,
                  :password,
                  :notify_url,
                  :payment_remarks,
                  :refund_remarks,
                  :on_behalf_of,
                  :merchant_code,
                  :merchant_pin,
                  :merchant_number,
                  :country_code,
                  :api_base_url,
                  :currency_code,
                  :terminal_id,
                  :location,
                  :super_merchant_name,
                  :merchant_name,
                  :purchase_category_code,
                  :description,
                  :reference_code,
                  :client_correlator_prefix

    def initialize
      @username = nil
      @password = nil
      @notify_url = nil
      @refund_remarks = nil
      @payment_remarks = nil
      @on_behalf_of = nil
      @merchant_code = nil
      @merchant_pin = nil
      @merchant_number = nil
      @country_code = nil
      @api_base_url = nil
      @currency_code = nil
      @terminal_id = nil
      @location = nil
      @super_merchant_name = nil
      @merchant_name = nil
      @purchase_category_code = nil
      @description = nil
      @reference_code = nil
      @client_correlator_prefix = nil
    end
  end
end
