class AddCommentToUsersWorkMaterial < ActiveRecord::Migration
  def change
    add_column :users_work_materials, :comment, :text, default: nil
  end
end
