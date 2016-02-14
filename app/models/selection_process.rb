class SelectionProcess < ActiveRecord::Base
	validates :university_name, presence: true
	validates :deadline, presence: true
	validates :activities, presence: true
	validates :link, presence: true, :format => URI::regexp(%w(http https))
end
