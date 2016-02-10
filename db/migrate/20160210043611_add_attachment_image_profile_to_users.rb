class AddAttachmentImageProfileToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :image_profile
    end
  end

  def self.down
    remove_attachment :users, :image_profile
  end
end
