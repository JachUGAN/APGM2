module UsersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user.
		def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatars/#{gravatar_id}.png"
		image_tag(gravatar_url, alt: user.username, class: "gravatar")
		end


		def Role(user)
			if user.role == "super"
				"Super Admin"
			elsif user.role == "admin"
				"Admin"
			elsif user.role == "author"
				"Author"
			elsif user.role == "normal"
				"Normal User"
			end
		end	

end
