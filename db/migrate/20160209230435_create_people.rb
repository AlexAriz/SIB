class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.string :university
      t.string :area_of_interest
      t.string :comments
      t.string :first_choice

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
