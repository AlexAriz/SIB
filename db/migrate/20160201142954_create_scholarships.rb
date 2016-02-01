class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.string :name
      t.references :university, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :description
      t.text :requirements
      t.text :benefits_offered
      t.string :url

      t.timestamps null: false
    end
  end
end
