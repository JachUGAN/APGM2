class Ability
  include CanCan::Ability

  	def initialize(user)
  		user ||= User.new # guest user

  		if user.role.to_s == "super" 
  			can :manage, :all  #manage represents ANY action on object and :manage is not just :create, :read, :update, :destroy
  		else
  			can :read, :all
        
        can :update, User, :id => user.id   #Only users can access their own Settings
          
  			if user.role.to_s == "author"      #Authors can only manage their own POsts (not events or users)

	        can :create, Post

	        can :update, Post do |post|
	          post.try(:user) == user 
	    		end

        	can :delete, Post do |post|
        		post.try(:user) == user 
        	end

		    end
		  	
		  	if user.role.to_s == "admin"       #Admins can manage all Posts and Events

		  		can :manage, Post  #MAYBE create a crud alias for admins (gotta think about it first)
          can :manage, Event
          
		  	end

  		end
  	end
 end