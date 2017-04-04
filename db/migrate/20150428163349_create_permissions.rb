class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :nome
      t.string :subject_class
      t.string :action
      t.string :controller_namespace

      t.timestamps null: false
    end
  end
end
