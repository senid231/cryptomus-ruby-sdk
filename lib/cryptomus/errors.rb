# frozen_string_literal: true

module Cryptomus
  module Errors
    class Error < StandardError
    end

    class ApiError < Error
      # @!method response [Faraday::Response,nil]
      # @!method status [Integer,nil]
      # @!method response_body [Hash,nil]
      attr_reader :response, :status, :response_body

      # @param response [Faraday::Response,nil]
      # @param msg [String,nil]
      def initialize(response, msg = nil)
        @response = response
        @status = response&.status
        @response_body = response&.body
        body_msg = response_body.is_a?(Hash) ? JSON.generate(response_body) : response_body
        msg ||= "Response #{status}, #{body_msg}" if response
        super(msg || self.class.name)
      end
    end
  end
end
