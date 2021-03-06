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
#  scholarship_id             :integer
#
# Indexes
#
#  fk_rails_3cce11318b                  (scholarship_id)
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_3cce11318b  (scholarship_id => scholarships.id)
#

# Candidate extends from User.
class Candidate < User
  scope :candidates, -> { where(type: 'Candidate') }
  has_and_belongs_to_many :work_materials
  belongs_to :tutor
  belongs_to :scholarship
  has_many :users_work_materials

  has_attached_file :image_profile,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :image_profile,
                                    content_type: %r{\Aimage\/.*\Z}

  def candidate_username
    user_name
  end
end
