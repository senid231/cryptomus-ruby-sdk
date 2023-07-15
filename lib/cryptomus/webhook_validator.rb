# frozen_string_literal: true

require 'json'

module Cryptomus
  module WebhookValidator
    module_function

    # https://doc.cryptomus.com/payments/webhook
    # @param payload [Hash]
    # @param sign [String]
    # @return [Boolean]
    def validate(payload:, sign:)
      payload_json = JSON.generate(payload)
      generated_sign = Cryptomus::Signature.generate(payload_json)
      generated_sign == sign
    end
  end
end
