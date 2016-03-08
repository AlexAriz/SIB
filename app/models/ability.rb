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
      permit_admin
    elsif user.type == User::TUTOR
      permit_tutor(user)
    elsif user.type == User::CANDIDATE
      permit_candidate(user)
    end
  end

  private

  def permit_admin
    can :manage, [User, Scholarship, SelectionProcess, University]
    cannot :manage, Tutor
    cannot :manage, UsersWorkMaterial
    can :read_and_update, WorkMaterial
  end

  def permit_tutor(user)
    can :read_and_update, User, id: user.id
    cannot :index, User
    can :cru, SelectionProcess
    can :read, University
    can :manage, Scholarship
    can :manage, WorkMaterial
    can :manage, Tutor
    cannot :index, Tutor
  end

  def permit_candidate(user)
    can :read, :all
    can :read_and_update, User, id: user.id
    cannot :index, User
    can :index, Tutor
    cannot :read, WorkMaterial
    can :update, Candidate
    can :read_and_update, UsersWorkMaterial
    can :request_as_tutor, Tutor
    can :cancel_tutoring, Tutor
    can :read_request, [Scholarship, Candidate]
  end
end
