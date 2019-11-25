class CreateDevolucaos < ActiveRecord::Migration[5.1]
  def change
    create_table :devolucaos do |t|
      t.references :aluno, index: true, foreign_key: { to_table: :users }
      t.references :bibliotecario, index: true, foreign_key: { to_table: :users }
      t.float :multa

      t.timestamps
    end
  end
end
