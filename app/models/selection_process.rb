# == Schema Information
#
# Table name: selection_processes
#
#  id            :integer          not null, primary key
#  deadline      :date
#  activities    :text(65535)
#  link          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  university_id :integer
#
# Indexes
#
#  index_selection_processes_on_university_id  (university_id)
#
# Foreign Keys
#
#  fk_rails_e3ff189b6f  (university_id => universities.id)
#

# Class used to save the information of the
# Selection Process in the universities.
class SelectionProcess < ActiveRecord::Base
  belongs_to :university

  acts_as_commontable

  validates :deadline, presence: true, date: { after: proc { Date.today } }
  validates :activities, presence: true
  validates :link, presence: true, format: URI.regexp(%w(http https))
  validates :university_id, presence: true

  scope :by_university_id, lambda { |university_id|
    where('university_id LIKE ?', "%#{university_id}%")
  }
end
