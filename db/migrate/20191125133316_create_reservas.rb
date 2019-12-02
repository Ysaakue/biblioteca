class CreateReservas < ActiveRecord::Migration[5.1]
  def change
    create_table :reservas do |t|
      t.boolean :retirado

      t.timestamps
    end
  end
end
