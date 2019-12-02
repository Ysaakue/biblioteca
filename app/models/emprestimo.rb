class Emprestimo < ApplicationRecord
  belongs_to :aluno, :class_name => :User,:foreign_key => "aluno"
  belongs_to :bibliotecario, :class_name => :User,:foreign_key => "bibliotecario"
  #belongs_to :bibliotecario
  has_and_belongs_to_many :exemplares
  has_one :devolucao
end
