# frozen_string_literal: true

module Cryptomus
  class Configuration
    attr_accessor :api_key,
                  :merchant_id,
                  :base_url,
                  :user_agent,
                  :connection_config,
                  :handle_response,
                  :on_error,
                  :logger

    def initialize
      self.user_agent = "Cryptomus Ruby SDK #{Cryptomus::VERSION} (Ruby #{RUBY_VERSION})"
      self.base_url = Cryptomus::CONST::URL
    end
  end
end
