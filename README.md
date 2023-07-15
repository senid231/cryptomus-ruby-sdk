# Cryptomus

Ruby SDK for Cryptomus Crypto Payment Gateway.  
See the [documentation](https://doc.cryptomus.com)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add cryptomus

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install cryptomus

## Usage

```ruby
require 'cryptomus'

Cryptomus.configure do |config|
  config.merchant_id = 'your_merchant_id'
  config.api_key = 'your_api_key'
end

crypto_payment = Cryptomus::Client.create_payment(
  order_id: 'your_unique_order_id_from_your_system',
  amount: '100',
  currency: 'USD',
  lifetime: 24 * 60 * 60, # expires in 24 hours
  subtract: 100 # client will pay 100% of commission
)

puts "Pay URL: #{crypto_payment[:result][:url]}"
```

```ruby
crypto_payment = Cryptomus::Client.payment(order_id: 'your_unique_order_id_from_your_system')
if !crypto_payment[:result][:is_final]
  puts "Waiting for client to pay (status=#{crypto_payment[:result][:status]})"
elsif %w[paid paid_over].include?(crypto_payment[:result][:status])
  puts "Payment completed (amount=#{crypto_payment[:result][:payer_amount]}, status=#{crypto_payment[:result][:status]})"
else
  puts "Payment failed (status=#{crypto_payment[:result][:status]})"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/senid231/cryptomus.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
