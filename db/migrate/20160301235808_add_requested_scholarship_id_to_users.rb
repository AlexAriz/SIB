class AddRequestedScholarshipIdToUsers < ActiveRecord::Migration
  def up
     add_column :users, :scholarship_id, :integer
    add_foreign_key :users, :scholarships
  end

  def down
    remove_column :users, :scholarship_id
    remove_foreign_key :users, :scholarships

  end
end
