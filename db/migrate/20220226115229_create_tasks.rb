class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :task_type, null: false
      t.boolean :is_done, null: false, default: false
      t.string :title, null: false, default: ""
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
