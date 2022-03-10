class CreateSystemSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :system_settings do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :is_dark, null: false, default: false

      t.timestamps
    end
  end
end
