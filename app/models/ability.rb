# Class used by can can can gem
# where you defined the permissions.
class Ability
  include CanCan::Ability

  def initialize(user)
    # without the d -> of destroy:
    alias_action :create, :read, :update, to: :cru
    alias_action :read, :update, to: :read_and_update

    user ||= User.new # guest user (not logged in)
    if user.type == User::ADMIN
      can :manage, :all
    elsif user.type == User::TUTOR
      permit_tutor
    else
      permit_candidate
    end
  end

  private

  def permit_tutor
    can :read_and_update, User
    can :cru, SelectionProcess
    can :read, University
    can :manage, Scholarship
    can :manage, WorkMaterial
    can :manage, Tutor
  end

  def permit_candidate
    can :read, :all
    can :update, Candidate
    can :update, UsersWorkMaterial
    can :request_as_tutor, Tutor
    can :get_request, Scholarship
    can :get_request, Candidate
  end
end
