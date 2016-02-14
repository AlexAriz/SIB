class CreateSelectionProcesses < ActiveRecord::Migration
  def change
    create_table :selection_processes do |t|
      t.string :university_name
      t.string :deadline
      t.text :activities
      t.string :link

      t.timestamps null: false
    end
  end
end
