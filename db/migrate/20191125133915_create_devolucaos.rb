class CreateDevolucaos < ActiveRecord::Migration[5.1]
  def change
    create_table :devolucaos do |t|
      t.belongs_to :aluno, foreign_key: true
      t.belongs_to :bibliotecario, foreign_key: true
      t.float :multa

      t.timestamps
    end
  end
end
