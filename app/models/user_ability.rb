# frozen_string_literal: true

# User Ability
class UserAbility
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user.present?
      can :manage, Resume, user_id: user.id
      can :manage, :all if user.has_role? :admin
    else
      can :read, :all
    end
  end
end
