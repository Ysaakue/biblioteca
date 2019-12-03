class AddColumnLivroToReserva < ActiveRecord::Migration[5.1]
  def change
    add_column :reservas, :livro_id, :integer
  end
end
