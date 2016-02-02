# Candidate extends from User.
class Candidate < User
  scope :candidates, -> { where(type: 'Candidate') }
end
