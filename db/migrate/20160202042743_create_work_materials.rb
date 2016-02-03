class CreateWorkMaterials < ActiveRecord::Migration
  def change
    create_table :work_materials do |t|
      t.string :name
      t.text :description
      t.string :file_src
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
