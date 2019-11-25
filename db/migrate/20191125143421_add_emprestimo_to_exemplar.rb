class AddEmprestimoToExemplar < ActiveRecord::Migration[5.1]
  def change
    add_column :exemplares, :emprestimo_id, :integer
  end
end
