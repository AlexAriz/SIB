# == Schema Information
#
# Table name: users_work_materials
#
#  id               :integer          not null, primary key
#  work_material_id :integer
#  candidate_id     :integer
#  done             :boolean          default(FALSE)
#  progress         :integer          default(0)
#
# Indexes
#
#  index_users_work_materials_on_work_material_id  (work_material_id)
#
# Foreign Keys
#
#  fk_rails_539e96a199  (work_material_id => work_materials.id)
#

class UsersWorkMaterial < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :work_material
end
