class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    user ||= User.new

    if user.role? == 'superadmin'
      can :manage, :all
    elsif user.role? == 'admin'
      can :manage, :all
    elsif user.role? == 'registered'
      can :read, Product, :is_deleted => false
      can :create, Product
      # can :update, Product, :user_id => user.id
      can [:edit, :update], Product, :user_id => user.id
      can [:create, :read], Comment
      can [:update, :destroy], Comment, :user_id => user.id
      # can [:edit, :update], Product do |p|
      #   Rails.logger.info p.inspect
      #   p.user_id == user.id
      # end
      can :read, User::Dashboard
      can :notification, User::Dashboard
      can [:read, :edit_contact], User::Profile
      # Rails.logger.info user.inspect
      # puts user.id
      can :read, Category, :is_deleted => false
      can :create, Category
      cannot :read, [Admin, Admin::UserManager]
    elsif user.role? == 'blocked'
      can :read, Product
    else
      can :read, Product, :is_deleted => false
      can :read, Category, :is_deleted => false
      can :read, Comment
      cannot :read, [Admin, Admin::UserManager]
    end

  end
end
