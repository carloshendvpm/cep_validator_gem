# frozen_string_literal: true

require_relative "cep_validator/version"
require_relative "cep_validator/errors"
require_relative "cep_validator/validator"
require_relative "cep_validator/address"
require_relative "cep_validator/fetcher"

module CepValidator
  def self.valid?(cep)
    Validator.new(cep).validate
    begin
      Fetcher.new(cep).fetch
      true
    rescue NotFoundError
      false
    end
  rescue InvalidFormatError
    false
  end

  def self.fetch(cep)
    Fetcher.new(cep).fetch
  end
end
