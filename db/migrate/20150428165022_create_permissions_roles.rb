class CreatePermissionsRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions_roles do |t|
      t.references :permission, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true
    end
  end
end
