# Class person that is used
# in an user object
class Person < ActiveRecord::Base
  belongs_to :user

  validates :last_name, presence: true
  validates :name, presence: true
end
