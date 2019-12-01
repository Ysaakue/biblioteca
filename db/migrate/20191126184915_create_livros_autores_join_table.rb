class CreateLivrosAutoresJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :autores_livros, id: false do |t|
      t.integer :livros_id
      t.integer :autor_id
    end
  end
end
