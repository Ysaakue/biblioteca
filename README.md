## Aplicação Base para criação de Sistemas baseados em Rails 5 + Bootstrap.

Versão 2.2


## Dependências

* Ruby 2.4.1
* PostgreSQL >= 9.3
* Rails v5.1.1
* Devise v4.3.0
* CanCanCan v2.0.0
* Bootstrap 3 com bootstrap-sass v3.3.7
* Font-Awesome com font-awesome-sass v4.7.0.2
* Inspinia 2.7 (Tema Bootstrap)

## Funcionalidades

* Sistema de login completo usando Devise com link "Esqueci minha senha" e Botão de logout
* Sistema de Papeis e Permissões para permitir a criação de papéis com permissões específicas
* CRUD de Usuários no Backend
* CRUD de Papéis no Backend
* Tela de início com possibilidade de ser extendida para Dashboard
* Suporte a autenticação híbrida com suporte a senhas armazenadas no banco local ou no servidor do ActiveDirectory(LDAP)

## Como instalar

1. Clone o repositório

  ```
  git clone https://github.com/Ysaakue/biblioteca.git
  ```
2. Instalar rbenv seguindo este tutorial:

  ```
  https://gorails.com/setup/ubuntu/
  ```
3. Instalar ruby 2.4.1

  ```
  rbenv install 2.4.1
  rbenv local 2.4.1
  gem install 'bundler'
  ```
4. Instalar as dependências

  ```
  bundle install
  ```
5. Criar usuário do PostgreSQL
6. Alterar aquivo config/database.yml para refletir os usuários e senhas do postgreSQL

  ```
  Usuário: <usuario_do_bd>
  Senha: <senha_do_bd>
  ```
7. Criar banco de dados

  ```
  rake db:create
  ```
8. Rodar as migrations

  ```
  rake db:migrate
  ```
9. Criar permissões

  ```
  rake permissions:create
  ```
10. Criar usuário padrão do sistema e popular banco de dados

  ```
  rake db:seed
  ```
