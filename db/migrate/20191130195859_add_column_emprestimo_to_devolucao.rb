class AddColumnEmprestimoToDevolucao < ActiveRecord::Migration[5.1]
  def change
    add_column :devolucoes, :emprestimo_id, :integer
  end
end
