module Admin
  class UsersController < ResourceController
  	def seachuser
  		@u = User.all
  	end
  end
end
