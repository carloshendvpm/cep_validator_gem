# CepValidator

Valide e busque informações de CEPs brasileiros de forma simples usando Ruby!

## Instalação

Adicione esta linha ao seu Gemfile:

```ruby
 gem 'cep_validator', git: 'https://github.com/carloshendvpm/cep_validator_gem'
```

Ou instale diretamente:

```bash
gem install specific_install
gem specific_install https://github.com/carloshendvpm/cep_validator_gem
```
## Uso

### Validar um CEP

```ruby
require 'cep_validator'

CepValidator.valid?("01310-100") # => true
CepValidator.valid?("00000-000") # => false
CepValidator.valid?("12")        # => false
```

### Buscar informações de um CEP

```ruby
require 'cep_validator'

address = CepValidator.fetch("01310-100")
puts address # => Avenida Paulista, Bela Vista - São Paulo/SP - CEP: 01310-100

# Acessando os dados detalhados
puts address.to_h
# {
#   cep: "01310-100",
#   logradouro: "Avenida Paulista",
#   bairro: "Bela Vista",
#   cidade: "São Paulo",
#   uf: "SP",
#   complemento: "lado par"
# }
```

### Via linha de comando

```bash
cep_validator 01310-100
```

Saída:
```
✓ CEP válido: 01310-100

Buscando informações...
Avenida Paulista, Bela Vista - São Paulo/SP - CEP: 01310-100

Detalhes completos:
  Cep: 01310-100
  Logradouro: Avenida Paulista
  Bairro: Bela Vista
  Cidade: São Paulo
  Uf: SP
  Complemento: lado par
```

## Tratamento de erros

- `CepValidator::InvalidFormatError` — CEP com formato inválido
- `CepValidator::NotFoundError` — CEP não encontrado
- `CepValidator::ApiError` — Erro na consulta à API

## Desenvolvimento

Após clonar o repositório:

```bash
bin/setup
```

Para rodar os testes:

```bash
rake spec
```

Para abrir um console interativo:

```bash
bin/console
```

Para instalar a gem localmente:

```bash
bundle exec rake install
```
