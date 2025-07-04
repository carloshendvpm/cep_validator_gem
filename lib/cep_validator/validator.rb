# frozen_string_literal: true

module CepValidator
  class Validator
    CEP_REGEX = /\A\d{5}-?\d{3}\z/

    def initialize(cep)
      @cep = cep.to_s.strip
    end

    def validate
      raise InvalidFormatError, @cep unless valid_format?

      normalize_cep
    end

    def valid_format?
      @cep.match?(CEP_REGEX)
    end

    private

    def normalize_cep
      @cep.gsub(/\D/, "")
    end
  end
end
