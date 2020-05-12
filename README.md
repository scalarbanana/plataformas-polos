# PlataformasPolos
[![Coverage Status](https://coveralls.io/repos/github/asantos07/plataformas-polos/badge.svg)](https://coveralls.io/github/asantos07/plataformas-polos)
## README

### Dependências e versões
| | |
| ---------------- | ----- |
| Ruby             | 2.7.1 |
| Bundler          | 2.1.4 |
| NodeJS           | 10    |
| Servidor MongoDB | 4.*   |

### Variáveis de ambiente
| Chave | Valor |
|---|---|
| FQDN | FQDN de acesso à aplicação |
| RAILS, NODE, RACK (_ENV) | Ambiente da aplicação, pode ser `development`, `test` ou `production` |
| (DB_) HOST, NAME, USER, PASSWORD | Host, collection, nome de usuário e senha do MongoDB |
| (SMTP_) ADDRESS, USER, PASSWORD, DOMAIN | Endereço, usuário e senha do gateway para envio de emails, e o domínio HELO |

### Setup banco de dados
É necessário criar uma collection (como o nome especificado em `DB_NAME`) e um usuário (`DB_USER`) com as seguintes permissões:
```json
['readWrite','dbAdmin']
```

### Testes
Utilizam RSpec e Shoulda para declarações, Capybara para testes de aceitação no browser e Faker para gerar dados de teste.

<!-- This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
