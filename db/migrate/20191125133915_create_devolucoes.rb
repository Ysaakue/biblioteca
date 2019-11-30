class CreateDevolucoes < ActiveRecord::Migration[5.1]
  def change
    create_table :devolucoes do |t|
      t.references :aluno, index: true, foreign_key: { to_table: :users }
      t.references :bibliotecario, index: true, foreign_key: { to_table: :users }
      t.float :multa
      t.date :dt_dev

      t.timestamps
    end
  end
end
