# frozen_string_literal: true

module CepValidator
  class Address
    attr_reader :cep, :logradouro, :bairro, :cidade, :uf, :complemento

    def initialize(data)
      @cep = data["cep"]
      @logradouro = data["logradouro"]
      @bairro = data["bairro"]
      @cidade = data["localidade"]
      @uf = data["uf"]
      @complemento = data["complemento"]
    end

    def to_h
      {
        cep: @cep,
        logradouro: @logradouro,
        bairro: @bairro,
        cidade: @cidade,
        uf: @uf,
        complemento: @complemento
      }
    end

    def to_s
      "#{@logradouro}, #{@bairro} - #{@cidade}/#{@uf} - CEP: #{@cep}"
    end
  end
end
