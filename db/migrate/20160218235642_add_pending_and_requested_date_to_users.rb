class AddPendingAndRequestedDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pending, :boolean, default: true
    add_column :users, :requested_date, :date, default: nil
  end
end
