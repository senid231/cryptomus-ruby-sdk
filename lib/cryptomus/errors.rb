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

      # @param msg [String]
      # @param response [Faraday::Response,nil]
      def initialize(msg, response = nil)
        @response = response
        @status = response&.status
        @response_body = response&.body
        super(msg)
      end
    end
  end
end
