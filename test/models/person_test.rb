# == Schema Information
#
# Table name: people
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  last_name        :string(255)
#  university       :string(255)
#  area_of_interest :string(255)
#  comments         :string(255)
#  first_choice     :string(255)
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_people_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_b39dcee1e8  (user_id => users.id)
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
