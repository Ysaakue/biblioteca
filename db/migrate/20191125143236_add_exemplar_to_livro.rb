class AddExemplarToLivro < ActiveRecord::Migration[5.1]
  def change
    add_column :livros, :exemplar_id, :integer
  end
end
