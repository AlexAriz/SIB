class CreateWorkMaterialsCandidatesTable < ActiveRecord::Migration
  def change
    create_table :users_work_materials do |t|
      t.references :work_material, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
