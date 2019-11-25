class CreateEmprestimos < ActiveRecord::Migration[5.1]
  def change
    create_table :emprestimos do |t|
      t.belongs_to :aluno, foreign_key: true
      t.belongs_to :bibliotecario, foreign_key: true
      t.datetime :data_prev_ret

      t.timestamps
    end
  end
end
