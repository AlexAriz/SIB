# Candidate extends from User.
class Candidate < User
  scope :candidates, -> { where(type: 'Candidate') }
  has_and_belongs_to_many :work_materials
  belongs_to :tutor

  def candidate_username
    self.user_name
  end
end
