# frozen_string_literal: true

module Cryptomus
  module Client
    module_function

    # https://doc.cryptomus.com/payments/creating-invoice
    # @param attributes [Hash]
    # @option attributes [String] :order_id required
    # @option attributes [String] :currency required
    # @option attributes [String] :amount required
    # @return [Hash]
    # @raise [Cryptomus::Errors::ApiError]
    # @example
    #   Cryptomus::Client.create_invoice(
    #     order_id: '123',
    #     currency: 'USD',
    #     amount: '100'
    #   )
    def create_payment(attributes)
      connection.post('/v1/payment', body: attributes)
    end

    # https://doc.cryptomus.com/payments/payment-history
    # @param cursor [String,nil] from previous response paginate.nextCursor or paginate.previousCursor
    # @param date_from [String,nil] format: 'YYYY-MM-DD H:mm:ss'
    # @param date_to [String,nil] format: 'YYYY-MM-DD H:mm:ss'
    # @return [Hash]
    # @raise [Cryptomus::Errors::ApiError]
    def list_payments(cursor: nil, date_from: nil, date_to: nil)
      attributes = { date_from:, date_to: }.compact
      attributes = nil if attributes.empty?
      query = { cursor: }.compact
      query = nil if query.empty?
      connection.post('/v1/payment/list', body: attributes, query:)
    end

    # https://doc.cryptomus.com/payments/payment-information
    # @param uuid [String,nil] uuid or order_id must be passed.
    # @param order_id [String,nil] uuid or order_id must be passed.
    # @return [Hash]
    # @raise [Cryptomus::Errors::ApiError]
    def payment(uuid: nil, order_id: nil)
      attributes = { uuid:, order_id: }.compact
      connection.post('/v1/payment/info', body: attributes)
    end

    # https://doc.cryptomus.com/payments/list-of-services
    # @return [Hash]
    # @raise [Cryptomus::Errors::ApiError]
    def list_services
      connection.post('/v1/payment/services', body: {})
    end

    # https://doc.cryptomus.com/payments/creating-static
    # @param attributes [Hash]
    # @option attributes [String] :order_id required
    # @option attributes [String] :currency required
    # @option attributes [String] :network required
    # @return [Hash]
    # @raise [Cryptomus::Errors::ApiError]
    # @example
    #   Cryptomus::Client.create_wallet(
    #     order_id: '123',
    #     currency: 'USDT',
    #     network: 'tron'
    #   )
    def create_wallet(attributes)
      connection.post('/v1/wallet', body: attributes)
    end

    # https://doc.cryptomus.com/balance
    # @return [Hash]
    # @raise [Cryptomus::Errors::ApiError]
    # @example
    #   Cryptomus::Client.balance
    def balance
      connection.post('/v1/balance')
    end

    def connection
      @connection ||= Connection.new
    end
  end
end
