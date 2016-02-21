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

# Este es el modelo de Becas, todos sus campos son requeridos.
class Scholarship < ActiveRecord::Base
  belongs_to :university

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :university, presence: true
  validates :start_date, presence: true, date: { after: Proc.new { Time.now - 1.month } }
  validates :end_date, presence: true, date: { after: proc { Date.today } || {after: :start_date} }
  validates :description, presence: true, length: { minimum: 50, maximum: 400 }
  validates :requirements, presence: true, length: { minimum: 10, maximum: 400 }
  validates :benefits_offered, presence: true, length: { minimum: 10,
                                                         maximum: 400 }
  validates :url, presence: true

end
