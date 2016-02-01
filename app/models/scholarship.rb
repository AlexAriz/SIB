class Scholarship < ActiveRecord::Base
  belongs_to :university

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :university, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, presence: true
  validates :requirements, presence: true
  validates :benefits_offered, presence: true
  validates :url, presence: true
end
