class CreateLivros < ActiveRecord::Migration[5.1]
  def change
    create_table :livros do |t|
      t.string :titulo
      t.date :publicacao
      t.belongs_to :editora, foreign_key: true

      t.timestamps
    end
  end
end
