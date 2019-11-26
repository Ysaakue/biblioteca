class Editora < ApplicationRecord
  belongs_to :estado
  belongs_to :cidade
  has_many :livros
end
