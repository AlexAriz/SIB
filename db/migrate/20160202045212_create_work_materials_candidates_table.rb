class CreateWorkMaterialsCandidatesTable < ActiveRecord::Migration
  def change
    create_table :users_work_materials do |t|
      t.references :work_material, index: true, foreign_key: true
      t.integer :candidate_id
    end
  end
end
