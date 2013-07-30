class PostsController < ApplicationController

def home
	
end

private	 #New strong parameter stuff

	def post_params
		params.require(:post).permit(:title, :content)		#User_id should not be accessible
	end

end
