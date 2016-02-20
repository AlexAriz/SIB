# == Schema Information
#
# Table name: selection_processes
#
#  id              :integer          not null, primary key
#  university_name :string(255)
#  deadline        :date
#  activities      :text(65535)
#  link            :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

# Class used to save the information of the
# Selection Process in the universities.
class SelectionProcess < ActiveRecord::Base
  validates :university_name, presence: true, length: { maximum: 50 }
  validates :deadline, presence: true, date: { after: proc { Date.today } }
  validates :activities, presence: true
  validates :link, presence: true, format: URI::regexp(%w(http https))
end
