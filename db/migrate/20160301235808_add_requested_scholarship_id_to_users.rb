class AddRequestedScholarshipIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :requested_scholarship_id, :integer
  end
end
