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
        msg ||= "Response #{status}, #{response_body}" if response
        super(msg || self.class.name)
      end
    end
  end
end
