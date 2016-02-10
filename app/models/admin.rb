# Admin extends from User.
class Admin < User
  scope :admins, -> { where(type: 'Admin') }

  has_attached_file :image_profile,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :image_profile,
                                    content_type: /\Aimage\/.*\Z/
end
