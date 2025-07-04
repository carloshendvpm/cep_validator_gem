# frozen_string_literal: true

RSpec.describe CepValidator do
  it "has a version number" do
    expect(CepValidator::VERSION).not_to be nil
  end

  it "returns true for a valid CEP" do
    expect(CepValidator.valid?("01001-000")).to eq(true)
  end

  it "returns false for an invalid CEP" do
    expect(CepValidator.valid?("00000-000")).to eq(false)
  end

  it "returns false for a malformed CEP" do
    expect(CepValidator.valid?("abc123")).to eq(false)
  end
end
