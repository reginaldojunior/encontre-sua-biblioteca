# Encontre Sua Biblioteca

README on English (Link)

O que é? Esse projeto tem como objetivo facilitar a procura pelas bibliotecas e os bairros periféricos, onde muitas vezes tem dificuldade de obter informações através dos livros e saber onde buscar esses conteúdos. Um projeto aberto, de código aberto e para o mundo.

# Como usar

## Dependencias

 - Docker
 - Docker Compose

## Instalando

 - `docker-compose build app`
 - `docker-compose run --rm app bin/rails db:create RAILS_ENV=development`
 - `docker-compose run --rm app bin/rails db:migrate RAILS_ENV=development`
 - `docker-compose up -d app`

Você já pode acessar a rota `http://localhost:3000` que verá a mensagem de boas vindas.

## Testes

 - `docker-compose build test`
 - `docker-compose run --rm app bin/rails db:create RAILS_ENV=test`
 - `docker-compose run --rm app bin/rails db:migrate RAILS_ENV=test`
 - `docker-compose run --rm test rspec ./spec`

# Contribuindo

Para contribuir basta clonar esse repositório instalar e sugerir alterações através de Pull Requests. Você também pode abrir issues de sugestões com melhorias.
