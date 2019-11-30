class Emprestimo < ApplicationRecord
  belongs_to :aluno
  belongs_to :bibliotecario
  has_and_belongs_to_many :exemplares
  has_one :devolucao
end
