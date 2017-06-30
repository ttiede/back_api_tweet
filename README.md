***Aplicação Backend - Listagem de Tweets***
=================


----------



----------
**Dependências**

----------


 - Ruby 2.4.0p0
 - Rails 5.1.2
 - Bundler 1.15.1


----------
***Orientações***

----------

Antes de executar o backend é necessário instalar as dependências:

 >   bundle install

Para iniciar o  servidor execute o comando:

   >  rails server

Acesso ao callpointers disponibilizado pelo backend:

 - Lista dos tweets por relevância.

`http://localhost:3000/most_relevants`  

 

- Lista os usuários que mais mencionam a empresa.

`http://localhost:3000/most_mentions`

Testes
 O comando abaixo executa os testes desenvolvidos:

  >  bundle exec rspec spec

