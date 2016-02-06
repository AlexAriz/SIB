class WorkMaterial < ActiveRecord::Base
  belongs_to :tutor, :class_name => 'User'
  has_and_belongs_to_many :candidates, :class_name => 'User'
  validates :name, presence: true, length: {minimum: 8}
  validates :description, presence: true
  validates :file_src, presence: true
end
