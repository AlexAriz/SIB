# Tutor extends from User.
class Tutor < User
  scope :tutors, -> { where(type: 'Tutor') }
  has_many :work_materials

  has_many :candidates
end
