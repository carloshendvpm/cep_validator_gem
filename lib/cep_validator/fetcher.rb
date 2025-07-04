# frozen_string_literal: true

require "net/http"
require "json"

module CepValidator
  class Fetcher
    VIACEP_URL = "https://viacep.com.br/ws/%s/json/"

    def initialize(cep)
      @cep = Validator.new(cep).validate
    end

    def fetch
      response = make_request
      parse_response(response)
    end

    private

    def make_request
      uri = URI(VIACEP_URL % @cep)

      begin
        response = Net::HTTP.get_response(uri)
        raise ApiError, "Erro HTTP: #{response.code}" unless response.code == "200"

        response.body
      rescue Net::TimeoutError, Net::OpenTimeout
        raise ApiError, "Timeout na consulta da API"
      rescue StandardError => e
        raise ApiError, "Erro na consulta: #{e.message}"
      end
    end

    def parse_response(response_body)
      data = JSON.parse(response_body)

      raise NotFoundError, @cep if data["erro"]

      Address.new(data)
    rescue JSON::ParserError
      raise ApiError, "Resposta inválida da API"
    end
  end
end
