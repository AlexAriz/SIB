# Tutor extends from User.
class Tutor < User
  scope :tutors, -> { where(type: 'Tutor') }
  has_many :work_materials

  has_attached_file :image_profile,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :image_profile,
                                    content_type: /\Aimage\/.*\Z/

  has_many :candidates
end
