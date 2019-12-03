class Reserva < ApplicationRecord
  belongs_to :aluno, :class_name => :User,:foreign_key => "user_id"
  belongs_to :livro
end
