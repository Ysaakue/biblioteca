class CreateExemplars < ActiveRecord::Migration[5.1]
  def change
    create_table :exemplars do |t|
      t.belongs_to :livro, foreign_key: true
      t.belongs_to :emprestimo, foreign_key: true
      t.datetime :aquisicao
      t.string :situacao
      t.boolean :em_emprestimo

      t.timestamps
    end
  end
end
