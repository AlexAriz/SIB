# == Schema Information
#
# Table name: scholarships
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  university_id    :integer
#  start_date       :date
#  end_date         :date
#  description      :text(65535)
#  requirements     :text(65535)
#  benefits_offered :text(65535)
#  url              :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_scholarships_on_university_id  (university_id)
#
# Foreign Keys
#
#  fk_rails_4c78106536  (university_id => universities.id)
#

require 'test_helper'

class ScholarshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
