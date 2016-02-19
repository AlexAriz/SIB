# == Schema Information
#
# Table name: work_materials
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  description             :text(65535)
#  tutor_id                :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#

require 'test_helper'

class WorkMaterialTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
