class AddAttachmentAttachmentToWorkMaterials < ActiveRecord::Migration
  def self.up
    change_table :work_materials do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :work_materials, :attachment
  end
end
