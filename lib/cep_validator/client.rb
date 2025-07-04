# frozen_string_literal: true

require "httparty"

# Cliente para comunicação com a API do ViaCEP.
# Responsável por validar se um CEP existe consultando o serviço público.
module CepValidator
  class Client
    BASE_URL = "https://viacep.com.br/ws"

    def self.valid?(cep)
      formatted = cep.to_s.gsub(/\D/, "")
      return false unless formatted.match?(/^\d{8}$/)

      response = HTTParty.get("#{BASE_URL}/#{formatted}/json/")
      response.code == 200 && !response.parsed_response["erro"]
    rescue StandardError => e
      e
    end
  end
end
