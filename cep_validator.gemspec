# frozen_string_literal: true

require_relative "lib/cep_validator/version"

Gem::Specification.new do |spec|
  spec.name = "cep_validator"
  spec.version = CepValidator::VERSION
  spec.authors = ["Carlos Henrique"]
  spec.email = ["hencarlosdv@gmail.com"]

  spec.summary = "Valida e busca informações de CEPs brasileiros"
  spec.description = "Uma gem simples para validar CEPs e buscar informações completas usando APIs públicas"
  spec.homepage = "https://github.com/carloshendvpm/cep_validator_gem"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.files << gemspec unless spec.files.include?(gemspec)
  spec.bindir = "exe"
  spec.executables = ["cep_validator"]
  spec.require_paths = ["lib"]


  spec.add_dependency "colorize"
end
