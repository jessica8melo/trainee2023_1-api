# README

## Rodando o repositorio:

```bash
rvm use 3.1.3
```

```bash
bundle
```

```bash
rails db:create
rails db:migrate
rails db:seed
rails s
```

## Alguns comandos relevantes:

- Criar repositório rails: `rails_<versão_do_rails>_new <nome_do_projeto> --api --database=’postgresql’`;
- Instalar gem: `bundle install`;
- Criar banco de dados: `rails db:create`;
- Criar uma model: `rails g model <Nome da model no singular> <atributo>:<tipo>`;
- Criar uma controller: `rails g controller <Nome da controller no plural>`;
- Rodar migração: `rails db:migrate`;
- Rodar seed: `rails db:seed`;
- Realizar testes com rspec: `rspec`;
- Abrir console do Rails: `rails c`;
- Abrir servidor do Rails: `rails s`;
- Adicionar atributo a uma model já criada: `rails g migration Add<Nome do atributo>To<Nome da model existente> <atributo>:<tipo>`;
- Remover atributo de uma model já criada: `rails g migration Remove<Nome do atributo>From<Nome da model existente> <atributo>:<tipo>`;
