# frozen_string_literal: true

require_relative 'cryptomus/version'
require_relative 'cryptomus/const'
require_relative 'cryptomus/errors'
require_relative 'cryptomus/configuration'
require_relative 'cryptomus/signature'
require_relative 'cryptomus/webhook_validator'
require_relative 'cryptomus/connection'
require_relative 'cryptomus/client'

# Cryptomus Crypto Payment Gateway
# [https://doc.cryptomus.com]
module Cryptomus
  module_function

  def configure
    yield config
  end

  def config
    @config ||= Configuration.new
  end
end
