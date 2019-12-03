class AddColumnLivroToExemplar < ActiveRecord::Migration[5.1]
  def change
    add_column :exemplares, :livro_id, :integer
  end
end
