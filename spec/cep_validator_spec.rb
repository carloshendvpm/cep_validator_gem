# frozen_string_literal: true

RSpec.describe CepValidator do
  describe ".valid?" do
    it "returns true for a valid CEP" do
      expect(CepValidator.valid?("01001-000")).to eq(true)
    end

    it "returns false for invalid format" do
      expect(CepValidator.valid?("abc")).to eq(false)
    end

    it "returns false for not found CEP" do
      expect(CepValidator.valid?("00000-000")).to eq(false)
    end
  end

  describe ".fetch" do
    it "returns a CepValidator::Address for a valid CEP" do
      address = CepValidator.fetch("01001-000")
      expect(address).to be_a(CepValidator::Address)
      expect(address.cep).to eq("01001-000")
    end

    it "raises InvalidFormatError for malformed CEP" do
      expect { CepValidator.fetch("12") }.to raise_error(CepValidator::InvalidFormatError)
    end

    it "raises NotFoundError for nonexistent CEP" do
      expect { CepValidator.fetch("00000-000") }.to raise_error(CepValidator::NotFoundError)
    end
  end
end
