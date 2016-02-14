# Candidate extends from User.
class Candidate < User
  scope :candidates, -> { where(type: 'Candidate') }
  has_and_belongs_to_many :work_materials
  belongs_to :tutor

  has_attached_file :image_profile,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :image_profile,
                                    content_type: /\Aimage\/.*\Z/

  def candidate_username
    user_name
  end
end
