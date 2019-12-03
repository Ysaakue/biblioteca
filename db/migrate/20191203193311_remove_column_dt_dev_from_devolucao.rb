class RemoveColumnDtDevFromDevolucao < ActiveRecord::Migration[5.1]
  def change
    remove_column :devolucoes, :dt_dev, :date
  end
end
