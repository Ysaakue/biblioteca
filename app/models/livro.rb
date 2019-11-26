class Livro < ApplicationRecord
  has_and_belongs_to_many :autores
  has_one :assunto
  has_many :exemplares
  belongs_to :editora
  has_many :reservas
end
