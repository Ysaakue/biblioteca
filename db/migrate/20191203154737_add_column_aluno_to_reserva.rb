class AddColumnAlunoToReserva < ActiveRecord::Migration[5.1]
  def change
    add_column :reservas, :aluno_id, :integer
  end
end
