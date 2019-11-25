class CreateEmprestimos < ActiveRecord::Migration[5.1]
  def change
    create_table :emprestimos do |t|
      t.references :aluno, index: true, foreign_key: { to_table: :users }
      t.references :bibliotecario, index: true, foreign_key: { to_table: :users }
      t.datetime :data_prev_ret

      t.timestamps
    end
  end
end
