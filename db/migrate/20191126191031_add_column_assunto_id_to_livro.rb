class AddColumnAssuntoIdToLivro < ActiveRecord::Migration[5.1]
  def change
    add_column :livros, :assunto_id, :integer
  end
end
