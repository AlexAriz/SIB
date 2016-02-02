# Admin extends from User.
class Admin < User
  scope :admins, -> { where(type: 'Admin') }
end
