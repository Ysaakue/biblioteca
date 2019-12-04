class Livro < ApplicationRecord
  has_and_belongs_to_many :autores
  has_one :assunto
  has_many :exemplares
  belongs_to :editora
  has_many :reservas

  def self.qnt_exemplares
    connection.select_all " SELECT livros.id,livros.titulo,count(exemplares.id) FROM livros,exemplares WHERE exemplares.livro_id = livros.id GROUP BY livros.id,livros.titulo"
  end
end
