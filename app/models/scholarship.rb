# Este es el modelo de Becas, todos sus campos son requeridos.
class Scholarship < ActiveRecord::Base
  belongs_to :university

  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :university, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, presence: true, length: { minimum: 50, maximum: 400 }
  validates :requirements, presence: true, length: { minimum: 10, maximum: 400 }
  validates :benefits_offered, presence: true, length: { minimum: 10, maximum: 400 }
  validates :url, presence: true
end
