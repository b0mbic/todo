class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.datetime :deadline_at
      t.string :title
      t.text :note
      t.boolean :is_done

      t.timestamps
    end
  end
end
