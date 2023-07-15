# frozen_string_literal: true

module Cryptomus
  class Configuration
    attr_accessor :api_key,
                  :merchant_id,
                  :user_agent,
                  :connection_config,
                  :on_error,
                  :logger

    def initialize
      self.user_agent = "Cryptomus Ruby SDK #{Cryptomus::VERSION} (Ruby #{RUBY_VERSION})"
    end
  end
end
