# The Main class of the users.
# This class is used by devise for setting the
# authentication
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :person

  has_attached_file :image_profile,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :image_profile,
                                    content_type: /\Aimage\/.*\Z/

  validates :user_name, presence: true
  validates :email, presence: true
  validates :type, presence: true

  after_create :set_empty_person


  accepts_nested_attributes_for :person, allow_destroy: true

  def set_empty_person
    Person.create(name: '',
                  last_name: '',
                  university: '',
                  area_of_interest: '',
                  comments: '',
                  first_choice: '',
                  user_id: self.id)


  end

end
