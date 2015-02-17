class Ability 
	include CanCan::Ability

	def initialize(user)
		unless user
			can :read, :all
			return
		end
		if user.role? :admin
			can :manage, :all
		else
			can :read, :all, :except => [User]
			can :create, Comment, user_id: user.id
      can :edit, User, id: user.id
			
			#can :update, Comment.where(user_id: user.id)
		end
	end
end