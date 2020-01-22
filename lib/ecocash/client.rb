module Ecocash
  class Client
    include HTTParty

    def charge_subscriber(msisdn, amount)
      url = "#{Ecocash.configuration.api_base_url}/transactions/amount"
      args = {
        clientCorrelator: generated_client_correlator,
        notifyUrl: Ecocash.configuration.notify_url,
        referenceCode: Ecocash.configuration.reference_code,
        tranType: 'MER',
        endUserId: msisdn,
        remarks: Ecocash.configuration.payment_remarks,
        transactionOperationStatus: 'CHARGED',
        paymentAmount: {
          charginginformation: {
            amount: amount,
            currency: Ecocash.configuration.currency_code,
            description: Ecocash.configuration.description
          },
          chargeMetaData: {
            channel: 'WEB',
            purchaseCategoryCode: Ecocash.configuration.purchase_category_code,
            onBeHalfOf: Ecocash.configuration.on_behalf_of
          }
        },
        merchantCode: Ecocash.configuration.merchant_code,
        merchantPin: Ecocash.configuration.merchant_pin,
        merchantNumber: Ecocash.configuration.merchant_number,
        currencyCode: Ecocash.configuration.currency_code,
        countryCode: Ecocash.configuration.country_code,
        terminalID: Ecocash.configuration.terminal_id,
        location: Ecocash.configuration.location,
        superMerchantName: Ecocash.configuration.super_merchant_name,
        merchantName: Ecocash.configuration.merchant_name
      }.to_json

      options = {
        body: args,
        basic_auth: auth,
        headers: { 'Content-Type' => 'application/json' }
      }
      response = self.class.post(url, options)
      JSON.parse(response.body)
    end

    def transaction_status(msisdn, client_correlator)
      url = "#{Ecocash.configuration.api_base_url}/#{msisdn}/transactions/amount/#{client_correlator}"
      options = {
        basic_auth: auth,
        headers: { 'Content-Type' => 'application/json' }
      }
      response = self.class.get(url, options)
      JSON.parse(response.body)
    end

    def list_transactions(msisdn)
      url = "#{Ecocash.configuration.api_base_url}/#{msisdn}/transactions"
      options = {
        basic_auth: auth,
        headers: { 'Content-Type' => 'application/json' }
      }
      response = self.class.get(url, options)
      JSON.parse(response.body)
    end

    def transaction_reversal(msisdn, transaction_id, amount)
      url = "#{Ecocash.configuration.api_base_url}/transactions/refund"
      args = {
        clientCorrelator: generated_client_correlator,
        referenceCode: Ecocash.configuration.reference_code,
        tranType: 'REF',
        endUserId: msisdn,
        originalEcocashReference: transaction_id,
        remark: Ecocash.configuration.refund_remarks,
        paymentAmount: {
          charginginformation: {
            amount: amount,
            currency: Ecocash.configuration.currency_code,
            description: Ecocash.configuration.description
          },
          chargeMetaData: {
            channel: 'SMS',
            purchaseCategoryCode: Ecocash.configuration.purchase_category_code,
            onBeHalfOf: Ecocash.configuration.on_behalf_of
          }
        },
        merchantCode: Ecocash.configuration.merchant_code,
        merchantPin: Ecocash.configuration.merchant_pin,
        merchantNumber: Ecocash.configuration.merchant_number,
        currencyCode: Ecocash.configuration.currency_code,
        countryCode: Ecocash.configuration.country_code,
        terminalID: Ecocash.configuration.terminal_id,
        location: cocash.configuration.location,
        superMerchantName: Ecocash.configuration.super_merchant_name,
        merchantName: Ecocash.configuration.merchant_name
      }.to_json

      options = {
        body: args,
        basic_auth: auth,
        headers: { 'Content-Type' => 'application/json' }
      }
      response = self.class.post(url, options)
      JSON.parse(response.body)
    end

    private

    def generated_client_correlator
      Time.now.strftime(
        "#{Ecocash.configuration.client_correlator_prefix}%d%m%Y%H%M%S%L%3N"
      )
    end

    def auth
      {
        username: Ecocash.configuration.username,
        password: Ecocash.configuration.password
      }
    end
  end
end
