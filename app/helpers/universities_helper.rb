# == Schema Information
#
# Table name: universities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  city        :string(255)
#  state       :string(255)
#  country     :string(255)
#  information :text(65535)
#  url         :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Helper for the university controller
module UniversitiesHelper
end
