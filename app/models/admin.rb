# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  email                      :string(255)      default(""), not null
#  encrypted_password         :string(255)      default(""), not null
#  type                       :string(255)
#  user_name                  :string(255)
#  reset_password_token       :string(255)
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  sign_in_count              :integer          default(0), not null
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :string(255)
#  last_sign_in_ip            :string(255)
#  confirmation_token         :string(255)
#  confirmed_at               :datetime
#  confirmation_sent_at       :datetime
#  unconfirmed_email          :string(255)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  tutor_id                   :integer
#  image_profile_file_name    :string(255)
#  image_profile_content_type :string(255)
#  image_profile_file_size    :integer
#  image_profile_updated_at   :datetime
#  pending                    :boolean          default(TRUE)
#  requested_date             :date
#  requested_scholarship_id   :integer
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

# Admin extends from User.
class Admin < User
  scope :admins, -> { where(type: 'Admin') }

  has_attached_file :image_profile,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :image_profile,
                                    content_type: %r{\Aimage\/.*\Z}
end
