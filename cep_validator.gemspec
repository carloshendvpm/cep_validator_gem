Gem::Specification.new do |spec|
  spec.name          = "cep_validator"
  spec.version       = "0.1.0"
  spec.authors       = ["Carlos Henrique"]
  spec.email         = ["hencarlosdv@gmail.com"]
  spec.summary       = "Valida e busca informações de CEPs brasileiros"
  spec.description   = "Uma gem simples para validar CEPs e buscar informações completas usando APIs públicas"
  spec.homepage      = "https://github.com/carloshendvpm/cep_validator_gem"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.files         = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 6.0"
  spec.add_development_dependency "webmock", "~> 3.0"
end