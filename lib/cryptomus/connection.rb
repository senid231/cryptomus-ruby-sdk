# frozen_string_literal: true

require 'faraday'

module Cryptomus
  class Connection
    MIME_TYPE = 'application/json'

    # @param path [String]
    # @param body [Hash, nil]
    # @raise [Cryptomus::Errors::ApiError]
    def post(path, body: nil, query: nil)
      response = connection.post do |req|
        req.url(path, query)
        raw_body = body&.to_json
        req.body = raw_body
        req[:sign] = Signature.generate(raw_body)
      end
      handle_response(response)
      response.body
    end

    private

    def connection
      Faraday.new(connection_options) do |builder|
        builder.adapter Faraday.default_adapter
        builder.request :json
        builder.response :json, parser_options: { symbolize_names: true }
        builder.response :logger, Cryptomus.config.logger, bodies: true if Cryptomus.config.logger
        Cryptomus.config.connection_config&.call(builder)
      end
    end

    def handle_response(response)
      return if response.success?
      return if Cryptomus.config.handle_response&.call(response)

      raise Cryptomus::Errors::ApiError, response
    end

    def connection_options
      {
        url: Cryptomus.config.base_url,
        headers: {
          'Content-Type' => MIME_TYPE,
          merchant: Cryptomus.config.merchant_id,
          user_agent: Cryptomus.config.user_agent
        }
      }
    end
  end
end
