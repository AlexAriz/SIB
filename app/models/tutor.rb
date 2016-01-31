class Tutor < User
  scope :tutors, -> { where(type: 'Tutor') }
end
