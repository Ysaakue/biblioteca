class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :reservas, :aluno_id, :user_id
  end
end
