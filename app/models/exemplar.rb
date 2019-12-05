class Exemplar < ApplicationRecord
  belongs_to :livro
  has_and_belongs_to_many :emprestimos
  validates :livro, presence: true
end
