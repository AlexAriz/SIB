# Modelo de universidad
class University < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :information, presence: true
  validates :url, presence: true
end
