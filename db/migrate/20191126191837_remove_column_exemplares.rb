class RemoveColumnExemplares < ActiveRecord::Migration[5.1]
  def change
    remove_column :exemplares, :emprestimo_id
  end
end
