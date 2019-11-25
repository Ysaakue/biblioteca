class CreateReservas < ActiveRecord::Migration[5.1]
  def change
    create_table :reservas do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :livro, foreign_key: true
      t.boolean :retirado

      t.timestamps
    end
  end
end
