class Devolucao < ApplicationRecord
  belongs_to :aluno
  belongs_to :bibliotecario
  belongs_to :emprestimo
end
