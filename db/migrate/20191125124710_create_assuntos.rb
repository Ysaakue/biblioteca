class CreateAssuntos < ActiveRecord::Migration[5.1]
  def change
    create_table :assuntos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
