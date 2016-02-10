# Class person that is used
# in an user object
class Person < ActiveRecord::Base
  belongs_to :user
end
