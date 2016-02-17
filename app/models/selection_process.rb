# Class used to save the information of the
# Selection Process in the universities.
class SelectionProcess < ActiveRecord::Base
  validates :university_name, presence: true, length: { maximum: 50 }
  validates :deadline, presence: true, date: { after: proc { Date.today } }
  validates :activities, presence: true
  validates :link, presence: true, format: URI::regexp(%w(http https))
end
