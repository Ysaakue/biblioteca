class CreateAutors < ActiveRecord::Migration[5.1]
  def change
    create_table :autors do |t|
      t.string :nome

      t.timestamps
    end
  end
end
