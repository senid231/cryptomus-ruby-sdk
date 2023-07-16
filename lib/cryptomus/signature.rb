# frozen_string_literal: true

require 'base64'
require 'digest'

module Cryptomus
  module Signature
    module_function

    # https://doc.cryptomus.com/getting-started/request-format
    # @param raw_body [String]
    # @return [String]
    def generate(raw_body)
      raw_body_encoded = Base64.strict_encode64(raw_body || '')
      Digest::MD5.hexdigest("#{raw_body_encoded}#{Cryptomus.config.api_key}")
    end
  end
end
