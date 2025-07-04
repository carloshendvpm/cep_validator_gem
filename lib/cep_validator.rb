# frozen_string_literal: true

require_relative "cep_validator/version"
require_relative "cep_validator/client"

module CepValidator
  class Error < StandardError; end

  def self.valid?(cep)
    Client.valid?(cep)
  end
end
