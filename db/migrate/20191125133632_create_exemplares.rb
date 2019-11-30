class CreateExemplares < ActiveRecord::Migration[5.1]
  def change
    create_table :exemplares do |t|
      t.belongs_to :livro, foreign_key: true
      t.date :aquisicao
      t.string :situacao
      t.boolean :em_emprestimo

      t.timestamps
    end
  end
end
