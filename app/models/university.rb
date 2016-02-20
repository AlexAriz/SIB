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

# Modelo de universidad
class University < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :information, presence: true
  validates :url, presence: true
end
