class CreatePeople < ActiveRecord::Migration
  def change
    create_table :person do |t|
      t.string :name
      t.string :last_name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
