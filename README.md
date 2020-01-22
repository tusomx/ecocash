# EcoCash Ruby Library

This library provides developers with convenient access to the EcoCash Instant Payments(EIP) API from applications written in Ruby. The EcoCash Online API provides functionality to receive payments directly on your website or easily refund transactions to your customers.

## Documentation

See the [Ruby API docs](https://www.rubydoc.info/gems/ecocash/1.0.0)

## Requirements
To use the EcoCash Online API, the following things are required:
+ Get yourself a Merchant account from [EcoCash](https://www.ecocash.co.zw/)
+ Apply to be an Online Merchant(This is subject to approval)
+ Now you're ready to use EcoCash Online API
+ In order to accept payments in production mode, your integration will need to be verified by EcoCash.

## Installing

This package is available in RubyGems and can be installed with:
```shell
gem install ecocash
```
Or import it to your Gemfile
```ruby
gem 'ecocash'
```

## Usage
```ruby
require 'ecocash'
```
Values you will need from Ecocash
+ Username and password: These are credentials to authenticate the API
+ Merchant number, merchant code and pin: You change PIN on the time of activating your merchant number.

### Configuration
The library uses a configuration block for easy setup:

```ruby
Ecocash.configure do |config|
  config.api_base_url = ENV['API_BASE_URL']
  #Authentication
  config.username = ENV['USERNAME'] 
  config.password = ENV['PASSWORD'] 
  config.merchant_number =ENV['MERCHANT_NUMBER'] 
  config.merchant_code = ENV['MERCHANT_CODE'] 
  config.merchant_pin = ENV['MERCHANT_PIN'] 
  #Payment information
  config.description = "Payment description"
  config.on_behalf_of = "Service description"
  config.payment_remarks = "Transaction description"
  config.reference_code = "Transaction reference"
  config.purchase_category_code = "Online Payment"
  config.refund_remarks = "Refund transaction description"
  #Merchant details
  config.super_merchant_name = ENV['SUPER_MERCHANT_NAME'] 
  config.merchant_name = ENV['MERCHANT_NAME'] 
  config.terminal_id = "unique identifier"
  config.location = "your business physical location"
  config.notify_url = ENV['YOUR_CALLBACK_URL'] 
  
  config.currency_code = "USD"
  config.country_code = "ZW"
  #Client Correlator Prefix
  config.client_correlator_prefix = "any letter(up to 7) to prefix your client correlator"
end
```

Initialize the API client
```ruby
client = Ecocash::Client.new
```

### Charge Subscriber
```ruby
client.charge_subscriber('subscriber_mobile_number','amount')
```

### Refund Subscriber
```ruby
client.transaction_reversal('subscriber_mobile_number','transaction_id','amount')
```

### Transaction Status
```ruby
client.transaction_status('subscriber_mobile_number','client_correlator')
```

### List Subscriber Transactions
```ruby
client.list_transactions('subscriber_mobile_number')
```

## API Documentation
The API document can be obtain from EcoCash upon approval of your application.

## Contributing

Please read [CONTRIBUTING.md](https://github.com/tusomx/ecocash/blob/master/CONTRIBUTING.md) for details and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/tusomx/ecocash/tags). 

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/tusomx/ecocash/blob/master/LICENSE) file for details

