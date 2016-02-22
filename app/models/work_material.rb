# == Schema Information
#
# Table name: work_materials
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  description             :text(65535)
#  tutor_id                :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#

# Clase de Material de Trabajo, contiene las relaciones que tiene con los
# Usuarios y algunas validaciones
class WorkMaterial < ActiveRecord::Base
  belongs_to :tutor, class_name: 'User'
  has_and_belongs_to_many :candidates
  validates :name, presence: true, length: { minimum: 8, maximum: 30 }
  validates :description, presence: true, length: { minimum: 8, maximum: 140 }

  has_attached_file :attachment,
                    styles: { large: '400x600',
                              medium: '200x300>',
                              thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :attachment,
                                    content_type: %r{\Aimage\/.*\Z}
end
