class AddTutorToCandidate < ActiveRecord::Migration
  def change
    add_column :users, :tutor_id, :integer
  end
end
