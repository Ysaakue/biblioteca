class AddColumnEditoraToLivro < ActiveRecord::Migration[5.1]
  def change
    add_column :livros, :editora_id, :integer
  end
end
