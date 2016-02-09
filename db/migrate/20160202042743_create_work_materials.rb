class CreateWorkMaterials < ActiveRecord::Migration
  def change
    create_table :work_materials do |t|
      t.string :name
      t.text :description
      t.integer :tutor_id

      t.timestamps null: false
    end
  end
end
