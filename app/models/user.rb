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

# The Main class of the users.
# This class is used by devise for setting the
# authentication
class User < ActiveRecord::Base
  acts_as_commontator

  ADMIN = 'Admin'.freeze
  TUTOR = 'Tutor'.freeze
  CANDIDATE = 'Candidate'.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :person, dependent: :destroy

  has_attached_file :image_profile,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :image_profile,
                                    content_type: %r{\Aimage\/.*\Z}

  validates_presence_of :user_name, :type
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/
  validates :email,
            format: { with: VALID_EMAIL_REGEX },
            presence: true

  accepts_nested_attributes_for :person, allow_destroy: true
  after_create :set_empty_person

  scope :by_user_name, lambda { |user_name|
    where('user_name LIKE ?', "%#{user_name}%")
  }

  scope :by_email, lambda { |email|
    where('email LIKE ?', "%#{email}%")
  }

  scope :by_type, lambda { |type|
    where('type LIKE ?', "%#{type}%") if type != 'Seleccionar'
  }

  private

  def set_empty_person
    create_person(name: '--',
                  last_name: '--',
                  university: '',
                  area_of_interest: '',
                  comments: '',
                  first_choice: '')
  end
end
