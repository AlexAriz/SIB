class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.text :information
      t.string :url

      t.timestamps null: false
    end
  end
end
