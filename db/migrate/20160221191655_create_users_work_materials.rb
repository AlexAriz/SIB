class CreateUsersWorkMaterials < ActiveRecord::Migration
  def change
    add_column :users_work_materials, :done, :boolean, default: false
    add_column :users_work_materials, :progress, :integer, default: 0
  end
end
