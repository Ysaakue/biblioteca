class CreateDevolucoes < ActiveRecord::Migration[5.1]
  def change
    create_table :devolucoes do |t|
      t.float :multa
      t.date :dt_dev

      t.timestamps
    end
  end
end
