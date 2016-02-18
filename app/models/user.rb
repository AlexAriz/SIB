# The Main class of the users.
# This class is used by devise for setting the
# authentication
class User < ActiveRecord::Base
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
                                    content_type: /\Aimage\/.*\Z/

  validates :user_name, presence: true
  validates :email, presence: true
  validates :type, presence: true

  accepts_nested_attributes_for :person, allow_destroy: true

  after_create :set_empty_person

  def set_empty_person
    Person.create(name: '--',
                  last_name: '--',
                  university: '',
                  area_of_interest: '',
                  comments: '',
                  first_choice: '',
                  user_id: id)
  end
end
