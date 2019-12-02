class CreateEmprestimos < ActiveRecord::Migration[5.1]
  def change
    create_table :emprestimos do |t|
      t.belongs_to :aluno, foreign_key: { to_table: :users }
      t.belongs_to :bibliotecario, foreign_key: { to_table: :users }
      t.date :data_prev_dev

      t.timestamps
    end
  end
end
