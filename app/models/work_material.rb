# Clase de Material de Trabajo, contiene las relaciones que tiene con los
# Usuarios y algunas validaciones
class WorkMaterial < ActiveRecord::Base
  belongs_to :tutor, class_name: 'User'
  has_and_belongs_to_many :candidates
  validates :name, presence: true, length: { minimum: 8, maximum: 30 }
  validates :description, presence: true, length: { minimum: 8, maximum: 140 }

  has_attached_file :attachment,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :attachment,
                                    content_type: /\Aimage\/.*\Z/
end
